//
//  UIView+YHInputAccessoryView.m
//  HonourJJ
//
//  Created byYH on 2018/5/10.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "UIView+YHInputAccessoryView.h"
#import "UIColor+YH.h"
#import "UIButton+JKBlock.h"

@implementation UIView (YHInputAccessoryView)

-(void)showAccessoryView:(void (^)(UIView *))customView
                 leftBtn:(void (^)(UIButton *))btnLeftBlock
                rightBtn:(void (^)(UIButton *))btnRightBlock
               leftBlock:(void (^)(void))leftBlock
              rightBlock:(void (^)(void))rightBlock{
    
    
    if(![self isKindOfClass:[UITextView class]] &&
       ![self isKindOfClass:[UITextField class]]){
        return;
    }
    
    UIView * toolV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 44)];
    toolV.backgroundColor = [UIColor blackColor];
    if(customView){
        customView(toolV);
    }
    
    UIButton * btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.titleLabel.font = [UIFont yh_pfOfSize:13];
    btnLeft.frame = CGRectMake(0, 0, 60, CGRectGetHeight(toolV.frame));
    [btnLeft setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnLeft jk_addActionHandler:^(NSInteger tag) {
        if(leftBlock){
            leftBlock();
        }
    }];
    if(btnLeftBlock){
        btnLeftBlock(btnLeft);
        [toolV addSubview:btnLeft];
    }
    
    UIButton * btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.titleLabel.font = [UIFont yh_pfOfSize:13];
    btnRight.frame = CGRectMake(CGRectGetWidth(toolV.frame)-60, 0, 60, CGRectGetHeight(toolV.frame));
    [btnRight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnRight jk_addActionHandler:^(NSInteger tag) {
        if(rightBlock){
            rightBlock();
        }
    }];
    if(btnRightBlock){
        btnRightBlock(btnRight);
        [toolV addSubview:btnRight];
    }
    
    UIView * lineV = [UIView new];
    lineV.backgroundColor = [UIColor yh_colorByHexString:@"130c0e"];
    [toolV addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(toolV);
        make.height.mas_equalTo(1);
    }];
    
    if([self isKindOfClass:[UITextView class]]){
        UITextView * textV = (UITextView *)self;
        textV.inputAccessoryView = toolV;
    }else if([self isKindOfClass:[UITextField class]]){
        UITextField * textF = (UITextField *)self;
        textF.inputAccessoryView = toolV;
    }
}

/** 完成的输入按钮*/
- (void)showAccessoryDown:(void(^)(void))finishBlock{
    
    WS(weakSelf);
    [self showAccessoryView:nil leftBtn:nil rightBtn:^(UIButton *btn) {
        
        [btn setTitle:LS(@"完成") forState:UIControlStateNormal];
        
    } leftBlock:nil rightBlock:^{
        
        if([weakSelf isKindOfClass:[UITextView class]]){
            UITextView * textV = (UITextView *)weakSelf;
            [textV resignFirstResponder];
        }else if([weakSelf isKindOfClass:[UITextField class]]){
            UITextField * textF = (UITextField *)weakSelf;
            [textF resignFirstResponder];
        }
        if(finishBlock){
            finishBlock();
        }
    }];
    
}

/** 关闭的输入按钮*/
- (void)showAccessoryClose:(void(^)(void))closeBlock{
    
    WS(weakSelf);
    [self showAccessoryView:nil leftBtn:nil rightBtn:^(UIButton *btn) {
        
        [btn setTitle:LS(@"关闭") forState:UIControlStateNormal];
        
    } leftBlock:nil rightBlock:^{
        
        if([weakSelf isKindOfClass:[UITextView class]]){
            UITextView * textV = (UITextView *)weakSelf;
            [textV resignFirstResponder];
        }else if([weakSelf isKindOfClass:[UITextField class]]){
            UITextField * textF = (UITextField *)weakSelf;
            [textF resignFirstResponder];
        }
        if(closeBlock){
            closeBlock();
        }
    }];
    
}


@end
