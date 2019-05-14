//
//  YHBaseView.m
//  SuoShi
//
//  Created by YH on 2018/6/1.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "YHBaseView.h"

@implementation YHBaseView

//@dynamic yh_bgGgradientTo,yh_bgGgradientFrom,yh_bgGgradientFX;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self yh_commonInit];
    }
    return self;
}


- (void)yh_commonInit{};

-(void)dealloc
{
    NSLog(@"dealloc:%@",[self class]);
}



@end


