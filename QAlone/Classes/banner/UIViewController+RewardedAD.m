//
//  UIViewController+RewardedAD.m
//  Storybook
//
//  Created by RY003 on 2019/5/21.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import "UIViewController+RewardedAD.h"
#import <objc/runtime.h>
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

-(void (^)(void))adLoadFailBlock{
    return objc_getAssociatedObject(self, @selector(adLoadFailBlock));
}
-(void)setAdLoadFailBlock:(void (^)(void))adLoadFailBlock{
    objc_setAssociatedObject(self, @selector(adLoadFailBlock), adLoadFailBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSInteger)repeatTimes{
    return [objc_getAssociatedObject(self, @selector(repeatTimes)) integerValue];
}
- (void)setRepeatTimes:(NSInteger)repeatTimes{
    objc_setAssociatedObject(self, @selector(repeatTimes), @(repeatTimes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)rewardGet{
    return [objc_getAssociatedObject(self, @selector(rewardGet)) integerValue];
}
- (void)setRewardGet:(BOOL)rewardGet{
    objc_setAssociatedObject(self, @selector(rewardGet), @(rewardGet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




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
                        reward:(void(^__nullable)(void))reward{
    
    if(YHUserSetting.adClose){
        //广告是关闭的 不需要加载
        if(nextAction){
            nextAction();
        }
        return YES;
    }
    
    if(!bannerID){
        if(nextAction){
            nextAction();
        }
        return YES;
    }
    
    //激励广告
    YHRewardedADTimes * times = [[YHRewardedADTimes getUsingLKDBHelper] searchSingle:[YHRewardedADTimes class] where:@{@"key":posKey} orderBy:nil];
    if(!times){
        times = [YHRewardedADTimes new];
        times.key = posKey;
        times.times = 0;
        [[YHRewardedADTimes getUsingLKDBHelper] insertToDB:times];
    }
    
    if(!needTimes){
        needTimes = @[@"2"];
    }
    
    if([needTimes containsObject:@(times.times).stringValue]){
        WS(weakSelf);
        //显示 激励广告
        void(^showRewardAD)(void) = ^(void) {
            
            [weakSelf setGetReawrdBlock:^{
                times.times = times.times + 1;
                [[YHRewardedADTimes getUsingLKDBHelper] updateToDB:times where:@{@"key":posKey}];
                //得到奖励了
                if(nextAction){
                    nextAction();
                }
                if(reward){
                    reward();
                }
            }];
            [weakSelf setAdLoadFailBlock:^{
                if(nextAction){
                    nextAction();
                }
            }];
            
            GADRequest *request = [GADRequest request];
#if DEBUG
            request.testDevices = @[@"abf5a4987f4ca319081a8631fdcd3a37"];
#endif
            
            [GADRewardBasedVideoAd sharedInstance].delegate = self;
#if DEBUG
            [[GADRewardBasedVideoAd sharedInstance] loadRequest:request              withAdUnitID:@"ca-app-pub-3940256099942544/1712485313"];
#else
            [[GADRewardBasedVideoAd sharedInstance] loadRequest:request              withAdUnitID:bannerID];
            
#endif
            [SVProgressHUD show];
            weakSelf.rewardGet = NO;
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
        if(nextAction){
            nextAction();
        }
        
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
            self.adLoadFailBlock();
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
    
    self.rewardGet = YES;
    NSLog(@"%s ----- message = %@",__func__,rewardMessage);
    //    self.getReawrdBlock();
}

/// Tells the delegate that the reward based video ad failed to load.
- (void)rewardBasedVideoAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd
    didFailToLoadWithError:(NSError *)error{
    NSLog(@"%s --- %@",__func__,error);
    self.adLoadFailBlock();
    [SVProgressHUD dismiss];
}

/// Tells the delegate that a reward based video ad was received.
- (void)rewardBasedVideoAdDidReceiveAd:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}

/// Tells the delegate that the reward based video ad opened.
- (void)rewardBasedVideoAdDidOpen:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}

/// Tells the delegate that the reward based video ad started playing.
- (void)rewardBasedVideoAdDidStartPlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}

/// Tells the delegate that the reward based video ad completed playing.
- (void)rewardBasedVideoAdDidCompletePlaying:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}

/// Tells the delegate that the reward based video ad closed.
- (void)rewardBasedVideoAdDidClose:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
    if(self.rewardGet){
        self.getReawrdBlock();
    }
}

/// Tells the delegate that the reward based video ad will leave the application.
- (void)rewardBasedVideoAdWillLeaveApplication:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}

/// Tells the delegate that the reward based video ad's metadata changed. Called when an ad loads,
/// and when a loaded ad's metadata changes.
- (void)rewardBasedVideoAdMetadataDidChange:(GADRewardBasedVideoAd *)rewardBasedVideoAd{
    NSLog(@"%s",__func__);
}


@end




