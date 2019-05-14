//
//  YHNavcTitleView.m
//  HonourJJ
//
//  Created by YH003 on 2018/5/14.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHNavcTitleView.h"
#import <SDWebImage/UIButton+WebCache.h>

@implementation YHNavcTitleView


-(void)yh_commonInit{
    
    self.navcContentV = [[UIView alloc] init];
    self.navcContentV.backgroundColor = [UIColor clearColor];
    [self addSubview:self.navcContentV];
    [self.navcContentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    CGFloat hegitNavc =  NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT;
    
    self.navcTeadTitle = [UILabel new];
    self.navcTeadTitle.font = [UIFont yh_pfmOfSize:16];
    self.navcTeadTitle.textColor = [UIColor yh_colorByHexString:@"0x212329"];
    self.navcTeadTitle.textAlignment = NSTextAlignmentCenter;
    [self.navcContentV addSubview:self.navcTeadTitle];
    [self.navcTeadTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.navcContentV);
        make.height.mas_equalTo(hegitNavc);
        make.bottom.equalTo(self.navcContentV);
    }];
    
    CGFloat offsetEdge = AdaptedWidth(13);
    
    self.buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonLeft addTarget:self action:@selector(buttonLeftEvent) forControlEvents:UIControlEventTouchUpInside];
    self.buttonLeft.imageEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
    
    [self.navcContentV addSubview:self.buttonLeft];
    [self.buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navcContentV).offset(offsetEdge);
//        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(30), AdaptedWidth(30)));
        make.centerY.equalTo(self.navcTeadTitle);
        make.size.mas_equalTo(CGSizeMake(hegitNavc, hegitNavc));
    }];
    
    
    self.buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonRight addTarget:self action:@selector(buttonRightEvent) forControlEvents:UIControlEventTouchUpInside];
    self.buttonRight.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    
    [self.navcContentV addSubview:self.buttonRight];
    [self.buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navcContentV).offset(-offsetEdge);
//        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(30), AdaptedWidth(30)));
        make.centerY.equalTo(self.navcTeadTitle);
        make.size.mas_equalTo(CGSizeMake(hegitNavc, hegitNavc));
    }];
    
    
    self.buttonRight1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonRight1 addTarget:self action:@selector(buttonRightEvent1) forControlEvents:UIControlEventTouchUpInside];
    self.buttonRight1.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    
    [self.navcContentV addSubview:self.buttonRight1];
    [self.buttonRight1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.buttonRight.mas_left);
//        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(30), AdaptedWidth(30)));
//        make.centerY.equalTo(self.navcTeadTitle);
        make.centerY.equalTo(self.navcTeadTitle);
        make.size.mas_equalTo(CGSizeMake(hegitNavc, hegitNavc));
    }];
    self.buttonRight1.hidden = YES;

    self.navcTeadTitle.backgroundColor = [UIColor clearColor];
    self.buttonLeft.backgroundColor = [UIColor clearColor];
    self.buttonRight.backgroundColor = [UIColor clearColor];
    self.buttonRight1.backgroundColor = [UIColor clearColor];
//    self.navcTeadTitle.backgroundColor = [UIColor blueColor];
//    self.buttonLeft.backgroundColor = [UIColor redColor];
//    self.buttonRight.backgroundColor = [UIColor redColor];
//    self.buttonRight1.backgroundColor = [UIColor redColor];
    
    self.buttonRight.imageView.clipsToBounds = NO;
    self.buttonRight1.imageView.clipsToBounds = NO;
    self.buttonLeft.imageView.clipsToBounds = NO;
    
//    self.buttonLeft.backgroundColor = [UIColor randomColor];
//    self.buttonRight.backgroundColor = [UIColor randomColor];
//    self.buttonRight1.backgroundColor = [UIColor randomColor];
    
    [self navcBuildContentSubviews];
    
    self.navcIsShowing = YES;
}


- (void)buttonLeftEvent{
    if(self.navcClickLeftBlock){
        self.navcClickLeftBlock();
    }
}

- (void)buttonRightEvent{
    if(self.navcClickRightBlock){
        self.navcClickRightBlock();
    }
}

- (void)buttonRightEvent1{
    if(self.navcClickRight1Block){
        self.navcClickRight1Block();
    }
}

/** 创建其他视图 添加到 navcContentV上*/
- (void)navcBuildContentSubviews{
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if(self.navcIsShowing){
        return [super hitTest:point withEvent:event];
    }
    
    if(CGRectContainsPoint(self.buttonRight.frame, point)){
        return self.buttonRight;
    }
    if(CGRectContainsPoint(self.buttonRight1.frame, point)){
        return self.buttonRight1;
    }
    if(CGRectContainsPoint(self.buttonLeft.frame, point)){
        return self.buttonLeft;
    }
    return nil;
}



@end
