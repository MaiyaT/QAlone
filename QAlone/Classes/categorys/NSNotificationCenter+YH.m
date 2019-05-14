//
//  NSNotificationCenter+YH.m
//  SuoShi
//
//  Created by YH on 2019/3/11.
//  Copyright © 2019 YH. All rights reserved.
//

#import "NSNotificationCenter+YH.h"

#import <objc/runtime.h>


#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma GCC diagnostic ignored "-Wselector"
#pragma GCC diagnostic ignored "-Wgnu"


#import <Availability.h>
#if !__has_feature(objc_arc) || !__has_feature(objc_arc_weak)
#error This class requires automatic reference counting and weak references
#endif


typedef void (^FXNotificationBlock)(NSNotification *note, id observer);


static NSMutableArray *FXNotificationsGetObservers(id object, BOOL create)
{
    @synchronized(object)
    {
        static void *key = &key;
        NSMutableArray *wrappers = objc_getAssociatedObject(object, key);
        if (!wrappers && create)
        {
            wrappers = [NSMutableArray array];
            objc_setAssociatedObject(object, key, wrappers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return wrappers;
    }
}


@interface FXNotificationObserver : NSObject

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, weak) NSObject *object;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) FXNotificationBlock block;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, weak) NSNotificationCenter *center;

- (void)action:(NSNotification *)note;

@end


@implementation FXNotificationObserver

- (void)action:(NSNotification *)note
{
    __strong id strongObserver = self.observer;
    if (self.block && strongObserver)
    {
        if (!self.queue || [NSOperationQueue currentQueue] == self.queue)
        {
            self.block(note, strongObserver);
        }
        else
        {
            [self.queue addOperationWithBlock:^{
                self.block(note, strongObserver);
            }];
        }
    }
}

- (void)dealloc
{
    __strong NSNotificationCenter *strongCenter = _center;
    [strongCenter removeObserver:self];
}

@end


@implementation NSNotificationCenter (YH)


+ (void)load
{
    SEL original = @selector(removeObserver:name:object:);
    SEL replacement = @selector(FXNotification_removeObserver:name:object:);
    method_exchangeImplementations(class_getInstanceMethod(self, original),
                                   class_getInstanceMethod(self, replacement));
}

- (id)yh_addObserver:(id)observer
          forName:(nullable NSString *)name
           object:(nullable id)object
            queue:(nullable NSOperationQueue *)queue
       usingBlock:(FXNotificationBlock)block
{
    FXNotificationObserver *container = [[FXNotificationObserver alloc] init];
    container.observer = observer;
    container.object = object;
    container.name = name;
    container.block = block;
    container.queue = queue?queue:[NSOperationQueue mainQueue];
    container.center = self;
    
    [FXNotificationsGetObservers(observer, YES) addObject:container];
    [self addObserver:container selector:@selector(action:) name:name object:object];
    return container;
}

- (void)FXNotification_removeObserver:(id)observer name:(NSString *)name object:(id)object
{
    for (FXNotificationObserver *container in [FXNotificationsGetObservers(observer, NO) reverseObjectEnumerator])
    {
        __strong id strongObject = container.object;
        if (container.center == self &&
            (!container.name || !name || [container.name isEqualToString:name]) &&
            (!strongObject || !object || strongObject == object))
        {
            [FXNotificationsGetObservers(observer, NO) removeObject:container];
        }
    }
    if (object_getClass(observer) == [FXNotificationObserver class])
    {
        FXNotificationObserver *container = observer;
        __strong NSObject *strongObserver = container.observer;
        [FXNotificationsGetObservers(strongObserver, NO) removeObject:container];
    }
    [self FXNotification_removeObserver:observer name:name object:object];
}


@end
