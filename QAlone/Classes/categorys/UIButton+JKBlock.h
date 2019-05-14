//
//  UIButton+Block.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^JKTouchedButtonBlock)(NSInteger tag);

@interface UIButton (JKBlock)

-(void)jk_addActionHandler:(JKTouchedButtonBlock)touchHandler;
-(void)jk_addActionTouchDownHandler:(void(^)(UIButton * passBtn, NSInteger tag))touchHandler;

-(void)rgcsdj_addActionHandler:(void(^)(UIButton * passBtn))touchHandler;

@end
