//
//  UIViewController+RewardedAD.m
//  Storybook
//
//  Created by RY003 on 2019/5/21.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import "UIViewController+RewardedAD.h"
#import <objc/runtime.h>
#import "YHBsseDBModel.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface YHRewardedADTimes : YHBsseDBModel

@property (copy, nonatomic) NSString * key;
@property (assign, nonatomic) NSInteger times;

@end

@implementation YHRewardedADTimes


+ (void)initialize{
    [self removePropertyWithColumnName:@"error"];
}

/**
 *  @brief  是否将父实体类的属性也映射到sqlite库表
 *  @return BOOL
 */
+ (BOOL)isContainParent{
    return YES;
}

/**
 *  @brief  设定表名
 *  @return 返回表名
 */
+ (NSString *)getTableName{
    return @"adtimes";
}

///**
// *  @brief  设定表的单个主键
// *  @return 返回主键表
// */
//+ (NSString *)getPrimaryKey{
//    return @"itemID";
//}

@end





@implementation UIViewController (RewardedAD)


-(void (^)(void))getReawrdBlock{
    return objc_getAssociatedObject(self, @selector(getReawrdBlock));
}

-(void)setGetReawrdBlock:(void (^)(void))getReawrdBlock{
    objc_setAssociatedObject(self, @selector(getReawrdBlock), getReawrdBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSInteger)repeatTimes{
    return [objc_getAssociatedObject(self, @selector(repeatTimes)) integerValue];
}

- (void)setRepeatTimes:(NSInteger)repeatTimes{
    objc_setAssociatedObject(self, @selector(repeatTimes), @(repeatTimes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




- (BOOL)showReardAdByBannerID:(NSString *)bannerID podKey:(NSString *)posKey getReward:(void(^)(void))getReward{
    
    //激励广告
    YHRewardedADTimes * times = [[YHRewardedADTimes getUsingLKDBHelper] searchSingle:[YHRewardedADTimes class] where:@{@"key":posKey} orderBy:nil];
    if(!times){
        times = [YHRewardedADTimes new];
        times.key = posKey;
        times.times = 0;
        [[YHRewardedADTimes getUsingLKDBHelper] insertToDB:times];
    }
    
    if(times.times == 2){
        WS(weakSelf);
        //显示 激励广告
        void(^showRewardAD)(void) = ^(void) {
            
            [weakSelf setGetReawrdBlock:^{
                times.times = times.times + 1;
                [[YHRewardedADTimes getUsingLKDBHelper] updateToDB:times where:@{@"key":posKey}];
                if(getReward){
                    getReward();
                }
            }];
//            weakSelf.getReawrdBlock = getReward;
            
            GADRequest *request = [GADRequest request];
#if DEBUG
            request.testDevices = @[@"abf5a4987f4ca319081a8631fdcd3a37"];
#endif
            
            [GADRewardBasedVideoAd sharedInstance].delegate = self;
#if DEBUG
            [[GADRewardBasedVideoAd sharedInstance] loadRequest:request              withAdUnitID:@"ca-app-pub-3940256099942544/1712485313"];
#else
            [[GADRewardBasedVideoAd sharedInstance] loadRequest:request
                                                   withAdUnitID:bannerID];
            
#endif
            
            [SVProgressHUD show];
            weakSelf.repeatTimes = 0;
            [weakSelf readyToPlay];
        };
        
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:LS(@"\n需要观看视频才能继续使用\n\n") message:nil preferredStyle: UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:LS(@"观看") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
            showRewardAD();
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:LS(@"取消") style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
        return NO;
    }else{
        times.times = times.times + 1;
        [[YHRewardedADTimes getUsingLKDBHelper] updateToDB:times where:@{@"key":posKey}];
        return YES;
    }
}

- (void)readyToPlay{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([[GADRewardBasedVideoAd sharedInstance] isReady]) {
            [[GADRewardBasedVideoAd sharedInstance] presentFromRootViewController:self];
            [SVProgressHUD dismiss];
        }else if(self.repeatTimes < 8){
            self.repeatTimes = self.repeatTimes + 1;
            [self readyToPlay];
        }else{
            [YHHUD showInfoMsg:LS(@"加载失败,请重试")];
            [SVProgressHUD dismiss];
        }
    });
    
}


/// Tells the delegate that the reward based video ad has rewarded the user.
- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
   didRewardUserWithReward:(GADAdReward *)reward{
    NSString *rewardMessage =
    [NSString stringWithFormat:@"Reward received with currency %@ , amount %lf",
     reward.type,
     [reward.amount doubleValue]];
    NSLog(@"%@",rewardMessage);
    
    self.getReawrdBlock();
    
    NSLog(@"didRewardUserWithReward");
}

/// Tells the delegate that the reward based video ad failed to load.
- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error{
    
    self.repeatTimes = 100;
    [SVProgressHUD dismiss];
    
    NSLog(@"didFailToLoadWithError %@",error);
}

/// Tells the delegate that a reward based video ad was received.
- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdDidReceiveAd");
}

/// Tells the delegate that the reward based video ad opened.
- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdDidOpen");
}

/// Tells the delegate that the reward based video ad started playing.
- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdDidStartPlaying");
}

/// Tells the delegate that the reward based video ad completed playing.
- (void)rewardBasedVideoAdDidCompletePlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdDidCompletePlaying");
}

/// Tells the delegate that the reward based video ad closed.
- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdDidClose");
}

/// Tells the delegate that the reward based video ad will leave the application.
- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdWillLeaveApplication");
}

/// Tells the delegate that the reward based video ad's metadata changed. Called when an ad loads,
/// and when a loaded ad's metadata changes.
- (void)rewardBasedVideoAdMetadataDidChange:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"rewardBasedVideoAdMetadataDidChange");
}


@end




