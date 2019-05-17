//
//  UIView+YHAnimation.m
//  ZhuangZhuang
//
//  Created by RY003 on 2019/5/17.
//  Copyright © 2019 ZZL. All rights reserved.
//

#import "UIView+YHAnimation.h"

@implementation UIView (YHAnimation)



/** 点赞动画*/
- (void)yh_ani_zan{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@1.4, @1.0];
    animation.duration = 0.3;
    animation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:animation forKey:@"transform.scale"];
}

/** 大小跳动 动画*/
- (void)yh_ani_scale_loop{
    
    [self yh_ani_scale_loop:0.4 values:@[@1.0,@1.2]];
}

- (void)yh_ani_scale_loop:(NSTimeInterval)time values:(NSArray *)values
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = values;
    animation.duration = time;
    animation.autoreverses = YES; //是否重复
    animation.repeatCount = HUGE_VALF;//次数
    animation.calculationMode = kCAAnimationCubic;
    animation.removedOnCompletion = NO;//切换界面的时候会继续播放
    [self.layer addAnimation:animation forKey:@"transform.scale.loop"];
}

/** 旋转 动画*/
- (void)yh_ani_rotate_loop{
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:4 * M_PI];
    rotation.duration = 4;
    rotation.repeatCount = HUGE_VALF;
    //    rotation.autoreverses = YES;
    [self.layer addAnimation:rotation forKey:@"transform.rotation.z.loop"];
}

/** 旋转 动画 一次*/
- (void)yh_ani_rotate_once{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:M_PI];
    rotation.duration = 1;
    rotation.repeatCount = 1;
    //    rotation.autoreverses = YES;
    [self.layer addAnimation:rotation forKey:@"transform.rotation.z.loop"];
}

/** 点击缩放动画*/
- (void)yh_ani_clickScaling{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.2,@0.9,@1.05,@0.98,@1];
    animation.duration = 0.8;
    animation.repeatCount = 1;
    animation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:animation forKey:nil];
}

/** 左右摆动动画*/
- (void)yh_waveMotionAnnimation:(double)angle duration:(NSTimeInterval)time repeatCount:(NSInteger)count{
    //初始化一个动画
    CABasicAnimation *baseAnimation = [CABasicAnimation animation];
    //动画运动的方式，现在指定的是围绕Z轴旋转
    baseAnimation.keyPath = @"transform.rotation.z";
    //动画持续时间
    baseAnimation.duration = time;
    //开始的角度
    baseAnimation.fromValue = [NSNumber numberWithFloat:angle];
    //结束的角度
    baseAnimation.toValue = [NSNumber numberWithFloat:-angle];
    //动画的运动方式
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //是否反向移动动画
    baseAnimation.autoreverses = YES;
    baseAnimation.repeatCount = count;
    //动画结束后的状态
    baseAnimation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:baseAnimation forKey:@"transform.rotation.wave.loop"];
    
    
}

- (void)yh_ani_LadderAssist
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation.z";
    animation.values = @[@0,@(M_PI/8),@0,@(-M_PI/8),@0,@(M_PI/8),@0,@(-M_PI/8),@0,@(M_PI/8),@0,@(-M_PI/8),@0,@0];
    animation.keyTimes = @[@0.0, @0.025, @0.05, @0.075, @0.1, @0.125, @0.15, @0.175, @0.2, @0.225, @0.25, @0.275,@0.3,@1.0];
    animation.duration = 14;
    animation.repeatCount = HUGE_VALF;
    animation.calculationMode = kCAAnimationLinear;
    [self.layer addAnimation:animation forKey:nil];
}


/** 左右抖动*/
- (void)yh_shake_zuoyou{
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.x";
    shakeAnim.duration = 0.2;
    
    CGFloat delta = 2;
    shakeAnim.values = @[@0, @(delta), @(-delta), @0];
    shakeAnim.repeatCount = 3;
    [self.layer addAnimation:shakeAnim forKey:nil];
}

/** 上下抖动*/
- (void)yh_shake_shagnxia{
    
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.y";
    shakeAnim.duration = 0.2;
    
    CGFloat delta = 2;
    shakeAnim.values = @[@0, @(delta), @(-delta), @0];
    shakeAnim.repeatCount = 3;
    [self.layer addAnimation:shakeAnim forKey:nil];
}

@end
