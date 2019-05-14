//
//  YHBaseCustomNavcVController.h
//  HonourJJ
//
//  Created by YH on 2018/12/26.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHBaseViewController.h"
#import "YHNavcScrollAlphaView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBaseCustomNavcVController : YHBaseViewController

//默认 允许滑动的时候 调整标题颜色
@property (assign, nonatomic) BOOL allowScrollingChangeNavc;

@property (retain, nonatomic) YHNavcScrollAlphaView * navcHeadView;

- (YHNavcScrollAlphaView *)createCustomnavcHeadView;

@end

NS_ASSUME_NONNULL_END
