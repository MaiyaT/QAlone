//
//  UIViewController+RewardedAD.h
//  Storybook
//
//  Created by RY003 on 2019/5/21.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "YHBsseDBModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (RewardedAD)<GADRewardBasedVideoAdDelegate>

@property (copy, nonatomic) void(^getReawrdBlock)(void);
@property (copy, nonatomic) void(^adLoadFailBlock)(void);
@property (assign, nonatomic) BOOL rewardGet;//获得到奖励了
@property (assign, nonatomic) NSInteger repeatTimes;


/**
 显示激励广告
 
 @param posKey 位置的ID信息
 @param needTimes 位置点击次数 符合这些次数的时候 需要显示激励广告 传空 默认 2次
 @param nextAction 激励广告之后 执行的动作
 */
- (BOOL)yh_showReardAdByPosKey:(NSString *)posKey
                     needTimes:(NSArray <NSString *>*)needTimes
                      bannerID:(NSString *)bannerID
                showNextAction:(void(^__nullable)(void))nextAction
                        reward:(void(^__nullable)(void))reward;


@end



NS_ASSUME_NONNULL_END
