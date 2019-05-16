//
//  YHNavcBackTitleScrollShowView.m
//  HonourJJ
//
//  Created by YH on 2018/11/22.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHNavcBackTitleScrollShowView.h"

@implementation YHNavcBackTitleScrollShowView


-(void)buildScrollviewContentSubviews{
    
    [self.buttonLeft setImage:QAloneImageByName(@"navi_icon_back_white") forState:UIControlStateNormal];
    self.buttonLeft.backgroundColor = [[UIColor yh_colorByHexString:@"0x212329"] colorWithAlphaComponent:0.5];
    self.buttonLeft.layer.cornerRadius = AdaptedWidth(13);
    self.buttonLeft.layer.masksToBounds = YES;
    self.buttonLeft.imageEdgeInsets = UIEdgeInsetsZero;
    [self.buttonLeft mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(26), AdaptedWidth(26)));
    }];
    
    
    [self showWithBgAlpha:0 titleAlpha:0];
}

- (void)showSubWithBgAlpha:(CGFloat)bg_alpha titleAlpha:(CGFloat)title_alpha{
    
    self.buttonLeft.backgroundColor = [[UIColor yh_colorByHexString:@"0x212329"] colorWithAlphaComponent:0.5*(1-title_alpha)];
    
    if(title_alpha == 1){
        [self.buttonLeft setImage:QAloneImageByName(@"navi_back") forState:UIControlStateNormal];
    }else{
        [self.buttonLeft setImage:QAloneImageByName(@"navi_icon_back_white") forState:UIControlStateNormal];
    }
}


@end
