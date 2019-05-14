//
//  UIView+YHInputAccessoryView.h
//  HonourJJ
//
//  Created byYH on 2018/5/10.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YHInputAccessoryView)

- (void)showAccessoryView:(void(^)(UIView * toolbarV))customView
                  leftBtn:(void(^)(UIButton * btn))btnLeftBlock
                 rightBtn:(void(^)(UIButton * btn))btnRightBlock
                leftBlock:(void(^)(void))leftBlock
               rightBlock:(void(^)(void))rightBlock;

/** 完成的输入按钮*/
- (void)showAccessoryDown:(void(^)(void))finishBlock;
/** 关闭的输入按钮*/
- (void)showAccessoryClose:(void(^)(void))closeBlock;

@end
