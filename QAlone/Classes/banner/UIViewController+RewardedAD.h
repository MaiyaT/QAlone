//
//  UIViewController+RewardedAD.h
//  Storybook
//
//  Created by RY003 on 2019/5/21.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RewardedAD)<GADRewardBasedVideoAdDelegate>

@property (copy, nonatomic) void(^getReawrdBlock)(void);
@property (assign, nonatomic) NSInteger repeatTimes;

- (BOOL)showReardAdByBannerID:(NSString *)bannerID podKey:(NSString *)posKey getReward:(void(^)(void))getReward;


@end



NS_ASSUME_NONNULL_END
