//
//  NSNotificationCenter+YH.h
//  SuoShi
//
//  Created by YH on 2019/3/11.
//  Copyright © 2019 YH. All rights reserved.
//

//https://github.com/nicklockwood/FXNotifications
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"

@interface NSNotificationCenter (YH)


- (id)yh_addObserver:(id)observer
          forName:(nullable NSString *)name
           object:(nullable id)object
            queue:(nullable NSOperationQueue *)queue
       usingBlock:(void (^)(NSNotification *note, id observer))block;


#pragma GCC diagnostic pop

@end

NS_ASSUME_NONNULL_END
