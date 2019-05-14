//
//  YHBaseViewController.h
//  LinTool
//
//  Created by YH on 15/9/21.
//  Copyright © 2015年 000. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+YHNaivigationItem.h"
#import <KVOController/FBKVOController.h>

@interface YHBaseViewController : UIViewController


//@property (nonatomic, strong) UIButton *navRightBar;
//@property (nonatomic, strong) UIButton *navLeftBar;

/** KVO 建值监听*/
@property (retain, nonatomic) FBKVOController * yh_kvoC;

#pragma mark - NavigationViewController

- (void)yh_backEvent;


/**
 *  设置返回的按钮
 */
- (void)yh_setLeftPopback;


@end
