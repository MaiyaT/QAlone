//
//  YHAppDelegate.h
//  Keepscores
//
//  Created by YH on 2018/11/18.
//  Copyright © 2018 YH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHBaseNavigationController.h"

@protocol YHAppDelegateSubMethod <NSObject>

- (void)yh_didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YHAppDelegate : UIResponder<UIApplicationDelegate,YHAppDelegateSubMethod>

@property (strong, nonatomic) YHBaseNavigationController * mainNavc;

@property (strong, nonatomic) UIWindow * window;

/**
 *  退到后台的时间
 */
@property (retain, nonatomic) NSDate * enterBackgroundDate;

@end

NS_ASSUME_NONNULL_END
