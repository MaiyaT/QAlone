//
//  YHHUD.m
//  Storybook
//
//  Created by RY003 on 2019/5/10.
//  Copyright © 2019 YH. All rights reserved.
//

#import "YHHUD.h"
#import <Toast/Toast.h>

@implementation YHHUD


+ (void)showInfoMsg:(NSString *)msg
{
    if ([msg isEqual:[NSNull null]] || msg == nil || msg.length == 0) {
        return;
    }
    CSToastStyle *style = [[CSToastStyle alloc]initWithDefaultStyle];
    
    style.messageFont = [UIFont yh_pfOfSize:14];
    
    style.cornerRadius = 2.f;
    style.backgroundColor = [[UIColor yh_colorByHexString:@"f6f5ec"] colorWithAlphaComponent:0.9];
    style.horizontalPadding = AdaptedSize(16);
    style.verticalPadding = AdaptedSize(10);
    style.titleColor = [UIColor blackColor];
    style.messageColor = [UIColor blackColor];
    [CSToastManager setSharedStyle: style];
    
    [kKeyWindow makeToast:msg duration:1 position:CSToastPositionCenter];
    
}


@end
