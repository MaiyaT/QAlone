//
//  UIViewController+Banner.h
//  Storybook
//
//  Created by RY003 on 2019/5/22.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Banner)<GADBannerViewDelegate>

- (UIView *)showBannerByID:(NSString *)bannerID;

@end

NS_ASSUME_NONNULL_END
