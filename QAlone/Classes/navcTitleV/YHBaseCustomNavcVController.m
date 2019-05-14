//
//  YHBaseCustomNavcVController.m
//  HonourJJ
//
//  Created by YH on 2018/12/26.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHBaseCustomNavcVController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface YHBaseCustomNavcVController ()

@end

@implementation YHBaseCustomNavcVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //顶部导航栏视图
    self.fd_prefersNavigationBarHidden = YES;
    self.allowScrollingChangeNavc = YES;
    
    self.navcHeadView = [self createCustomnavcHeadView];
    if(self.navcHeadView){
        [self.view addSubview:self.navcHeadView];
        [self.navcHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(NAVIGATION_BAR_HEIGHT);
        }];
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.navcHeadView updateScrollVOffset:0];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.navcHeadView){
        [self.view bringSubviewToFront:self.navcHeadView];
    }
}

- (YHNavcScrollAlphaView *)createCustomnavcHeadView{
    WS(weakSelf);
    YHNavcScrollAlphaView * headV = [YHNavcScrollAlphaView new];
    [headV setNavcClickLeftBlock:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    return headV;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(self.navcHeadView &&
       self.allowScrollingChangeNavc){
        [self.navcHeadView updateScrollVOffset:scrollView.contentOffset.y];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
