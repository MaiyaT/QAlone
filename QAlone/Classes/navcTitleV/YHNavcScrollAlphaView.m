//
//  YHNavcScrollAlphaView.m
//  HonourJJ
//
//  Created by YH on 2018/7/28.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHNavcScrollAlphaView.h"

@implementation YHNavcScrollAlphaView


-(void)navcBuildContentSubviews{
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.navcEffectV = [[UIVisualEffectView alloc] initWithEffect:blur];
    self.navcEffectV.alpha = 0.85;
    [self.navcContentV insertSubview:self.navcEffectV atIndex:0];
    
    [self.navcEffectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.navcContentV);
    }];
    
    [self buildScrollviewContentSubviews];
    
    [self updateContentShow];
}

/** 更新内容显示*/
- (void)updateContentShow{
    
    
}

-(void)buildScrollviewContentSubviews{
    
    
}

- (void)addBottomLine{
    UIView * lineV = [UIView new];
    lineV.backgroundColor = [UIColor yh_colorByHexString:@"0xededed"];
    [self.navcEffectV.contentView addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.navcEffectV);
        make.height.mas_equalTo(1);
    }];
}

/** 表格滑动 偏移值变化调用*/
- (void)updateScrollVOffset:(CGFloat)offset{
    
    CGFloat alpha = 0;
    CGFloat alphaTitle = 0;
    CGFloat heightNavc = CGRectGetHeight(self.frame);
    if(heightNavc){
        if(offset >= heightNavc){
            alpha = 0.85;
            alphaTitle = 1;
            //        self.navcIsShowing = YES;
        }else{
            alpha = 0.85*(offset/heightNavc);
            alphaTitle = offset/heightNavc;
            //        self.navcIsShowing = NO;
        }
    }else{
        alpha = 0;
        alphaTitle = 1;
    }
    if(self.isInverse){
        [self showWithBgAlpha:(0.85-alpha) titleAlpha:(0.85-alphaTitle)];
    }else{
        [self showWithBgAlpha:alpha titleAlpha:alphaTitle];
    }
}

- (void)showWithBgAlpha:(CGFloat)bg_alpha titleAlpha:(CGFloat)title_alpha{
    
    if(!self.titleAlphaNoAdjuest){
        
        if(self.navcEffectV.alpha != bg_alpha){
            self.navcEffectV.alpha = bg_alpha;
        }
        
        self.navcTeadTitle.alpha = title_alpha;
    }
    
    [self showSubWithBgAlpha:bg_alpha titleAlpha:title_alpha];
}

- (void)showSubWithBgAlpha:(CGFloat)bg_alpha titleAlpha:(CGFloat)title_alpha{
    
}

@end
