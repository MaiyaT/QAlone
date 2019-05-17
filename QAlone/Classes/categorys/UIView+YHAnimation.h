//
//  UIView+YHAnimation.h
//  ZhuangZhuang
//
//  Created by RY003 on 2019/5/17.
//  Copyright © 2019 ZZL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YHAnimation)


/** 点赞动画*/
- (void)yh_ani_zan;
/** 大小跳动 动画*/
- (void)yh_ani_scale_loop;

- (void)yh_ani_scale_loop:(NSTimeInterval)time
                       values:(NSArray *)values;
/** 点击缩放动画*/
- (void)yh_ani_clickScaling;

/** 旋转 动画*/
- (void)yh_ani_rotate_loop;
/** 旋转 动画 一次*/
- (void)yh_ani_rotate_once;

/**
 *左右摆动动画
 @param angle 摆动角度
 @param time 动画时间
 @param count 重复次数
 */
- (void)yh_waveMotionAnnimation:(double)angle
                           duration:(NSTimeInterval)time
                        repeatCount:(NSInteger)count;



/**
 天梯助力动画
 */
- (void)yh_ani_LadderAssist;


/** 左右抖动*/
- (void)yh_shake_zuoyou;
/** 上下抖动*/
- (void)yh_shake_shagnxia;


@end

NS_ASSUME_NONNULL_END
