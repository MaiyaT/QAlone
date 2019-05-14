//
//  YHNavcScrollAlphaView.h
//  HonourJJ
//
//  Created by YH on 2018/7/28.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHNavcTitleView.h"

/** 根据视图滚动调整 透明度变化*/
@interface YHNavcScrollAlphaView : YHNavcTitleView

@property (retain, nonatomic) UIVisualEffectView * navcEffectV;

/** 标题保持透明度不变*/
@property (assign, nonatomic) BOOL titleAlphaNoAdjuest;

/** 表格滑动 偏移值变化调用*/
- (void)updateScrollVOffset:(CGFloat)offset;

- (void)addBottomLine;

/** 更新内容显示*/
- (void)updateContentShow;

//子视图 调用
-(void)buildScrollviewContentSubviews;


- (void)showWithBgAlpha:(CGFloat)bg_alpha titleAlpha:(CGFloat)title_alpha;

@end
