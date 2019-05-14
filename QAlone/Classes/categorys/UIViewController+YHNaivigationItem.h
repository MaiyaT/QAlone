//
//  UIViewController+YHNaivigationItem.h
//  SuoShi
//
//  Created by YH on 2017/3/15.
//  Copyright © 2017年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YHNaivigationItem)


-(void)yh_setLeftNavigationItemBarWithImg:(NSString *)imgURL andSelectImg:(NSString *)imgSelect andTitle:(NSString *)title andSelectTitle:(NSString *)selectTitle andEvent:(SEL)event andTarget:(id)target andFinishBlock:(void(^)(UIButton * sender))barBtnBlock;

-(void)yh_setRightNavigationItemBarWithImg:(NSString *)imgURL andSelectImg:(NSString *)imgSelect andTitle:(NSString *)title andSelectTitle:(NSString *)selectTitle andEvent:(SEL)event andTarget:(id)target andFinishBlock:(void(^)(UIButton * sender))barBtnBlock;


@end
