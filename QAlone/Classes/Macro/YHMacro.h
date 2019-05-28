//
//  YHMacro.h
//  Storybook
//
//  Created by YH on 2019/5/8.
//  Copyright © 2019 YH. All rights reserved.
//

#ifndef YHMacro_h
#define YHMacro_h


//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断是否为iPhone */
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断是否是iPhone X*/
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断iPHoneXr*/
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
/** 判断iPhoneXs*/
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
/** 判断iPhoneXs Max*/
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)





//导航栏高度
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
/// 状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))

//是否刘海屏
#define IS_INPHONEX_SERIES ((iPhoneX==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? YES : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (IS_INPHONEX_SERIES ? 44.0 : 20.0)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (IS_INPHONEX_SERIES ? 88.0 : 64.0)
// tabBar高度
#define TAB_BAR_HEIGHT (IS_INPHONEX_SERIES ? 84.0 : 50.0)
// home indicator
#define HOME_INDICATOR_HEIGHT (IS_INPHONEX_SERIES ? 34.f : 0.f)
//刘海高度
#define NAVIGATION_Bang_HEIGHT (IS_INPHONEX_SERIES ? 24 : 0)

//ZY tabBar高度
#define AG_TAB_BAR_HEIGHT (IS_INPHONEX_SERIES ? 100.0 : 68.0)


#define SCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)



#define AdaptedWidth(x)   (roundf(x*MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)/375.0))
#define AdaptedHeight(x)   (roundf(x*MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)/667.0))
#define AdaptedSize(x)  AdaptedWidth(x)



#define SystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])



/**  weakSelf */
#define WS(weakSelf)            __weak __typeof(&*self)weakSelf = self;
#define Strong(strongSelf)  __strong typeof(weakSelf) strongSelf = weakSelf;


#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define KDelegate (UIApplication.sharedApplication.delegate)


#define LS(s)     NSLocalizedString(s, nil)

#define  YHNetWorkChangeEventNotification   @"YHNetWorkChangeEventNotification"






#endif /* YHMacro_h */
