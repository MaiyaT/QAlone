//
//  YHNavcTitleView.h
//  HonourJJ
//
//  Created by YH003 on 2018/5/14.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHBaseView.h"

@interface YHNavcTitleView : YHBaseView

@property (retain, nonatomic) UILabel * navcTeadTitle;
@property (retain, nonatomic) UIButton * buttonLeft;
@property (retain, nonatomic) UIButton * buttonRight;
@property (retain, nonatomic) UIButton * buttonRight1;
@property (retain, nonatomic) UIView * navcContentV;

//导航栏已显示
@property (assign, nonatomic) BOOL navcIsShowing;


@property (copy, nonatomic) void(^navcClickRightBlock)(void);
@property (copy, nonatomic) void(^navcClickRight1Block)(void);
@property (copy, nonatomic) void(^navcClickLeftBlock)(void);

/** 创建其他视图 添加到 navcContentV上*/
- (void)navcBuildContentSubviews;

@end
