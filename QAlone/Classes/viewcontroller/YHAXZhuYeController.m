//
//  YHAXZhuYeController.m
//  Storybook
//
//  Created by YH on 2019/5/8.
//  Copyright © 2019 YH. All rights reserved.
//

#import "YHAXZhuYeController.h"
#import "YHBaseNavigationController.h"
#import <YYKit/UIImage+YYAdd.h>

@interface YHAXZhuYeController ()

/// Action bar button item of tool bar.

@property (retain, nonatomic) UIView * webBottomV;

@property (retain, nonatomic) UIButton * webBtnHome;
@property (retain, nonatomic) UIButton * webBtnBack;
@property (retain, nonatomic) UIButton * webBtnForward;
@property (retain, nonatomic) UIButton * webBtnRefresh;
@property (retain, nonatomic) UIButton * webBtnT;

@end


@implementation YHAXZhuYeController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%zd", YHUserSetting.toolbarpos);
    if(YHUserSetting.toolbarpos == 0){
        self.navigationType = AXWebViewControllerNavigationToolItem;
        return;
    }else if (YHUserSetting.toolbarpos == 1){
        self.navigationType = AXWebViewControllerNavigationBarItem;
        return;
    }
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    if(YHUserSetting.toolbarpos > 2){
        [self fullscreenLay];
        return;
    }
    
    self.webBottomV = [UIView new];
    self.webBottomV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webBottomV];
    [self.webBottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(AdaptedWidth(44)+HOME_INDICATOR_HEIGHT);
    }];
    
    self.webBtnHome = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.webBtnHome setImage:QAloneImageByName(@"tabbar_home") forState:UIControlStateNormal];
    [self.webBtnHome addTarget:self action:@selector(homeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.webBottomV addSubview:self.webBtnHome];
    
    self.webBtnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.webBtnBack setImage:QAloneImageByName(@"tabbar_houtui") forState:UIControlStateNormal];
    [self.webBtnBack addTarget:self action:@selector(goBackClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.webBottomV addSubview:self.webBtnBack];
    
    self.webBtnForward = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.webBtnForward setImage:QAloneImageByName(@"tabbar_qianjin") forState:UIControlStateNormal];
    [self.webBtnForward addTarget:self action:@selector(goForwardClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.webBottomV addSubview:self.webBtnForward];
    
    self.webBtnRefresh = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.webBtnRefresh setImage:QAloneImageByName(@"tabbar_refresh") forState:UIControlStateNormal];
    [self.webBtnRefresh setImage:QAloneImageByName(@"tabbar_quxiao") forState:UIControlStateSelected];
    [self.webBtnRefresh addTarget:self action:@selector(reloadEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.webBottomV addSubview:self.webBtnRefresh];
    
    self.webBtnT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.webBtnT setImage:QAloneImageByName(@"tabbar_quit") forState:UIControlStateNormal];
    [self.webBtnT addTarget:self action:@selector(quitButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.webBottomV addSubview:self.webBtnT];
    
    NSArray * listV = @[self.webBtnHome,self.webBtnBack,self.webBtnForward,self.webBtnRefresh,self.webBtnT];
    [listV mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [listV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.webBottomV);
        make.height.mas_equalTo(AdaptedWidth(44));
    }];
    
    UIView * progressV = [self progressV];
    [progressV removeFromSuperview];
    [self.webBottomV addSubview:progressV];
    [progressV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.webBottomV);
        make.height.mas_equalTo(1);
    }];
    
    UIView * headV = [UIView new];
    headV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headV];
    [headV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(STATUS_BAR_HEIGHT);
    }];
    
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(headV.mas_bottom);
        make.bottom.equalTo(self.webBottomV.mas_top);
    }];
    
    
}


- (void)fullscreenLay{
    self.webView.backgroundColor = [UIColor blackColor];
    self.webView.superview.backgroundColor = [UIColor blackColor];
    
    if (@available(iOS 11.0, *)) {
        self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    self.showsBackgroundLabel = NO;
    
    [self.webView.superview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.webView.superview);
    }];
}


- (void)updateToolbarItems {
    
    if(YHUserSetting.toolbarpos < 2){
        [super updateToolbarItems];
        return;
    }
    
    self.webBtnBack.enabled = self.self.webView.canGoBack;
    self.webBtnForward.enabled = self.self.webView.canGoForward;
    self.webBtnHome.enabled = self.backBarButtonItem.enabled;
    self.webBtnRefresh.selected = self.self.webView.isLoading;
}

- (void)reloadEvent{
    if(self.webBtnRefresh.selected){
        [self stopClicked:nil];
    }else{
        [self reloadClicked:nil];
    }
}

- (void)homeButtonClicked{
    [self loadURL:[NSURL URLWithString:YHUserSetting.wangyeLJ]];
}

//离开
- (void)quitButtonClicked{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:QAloneLocalizedString(@"\n离开应用\n") message:nil preferredStyle: UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:QAloneLocalizedString(@"取消") style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:QAloneLocalizedString(@"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [YHAXZhuYeController clearWebCacheCompletion:nil];
        @throw [NSException exceptionWithName:@"user" reason:QAloneLocalizedString(@"退出") userInfo:nil];
        NSArray * list = @[];
        NSString * index = list[1];
        NSLog(@"%@",index);
    }]];
    [kKeyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


+ (UIViewController *)rootViewShow{
    YHAXZhuYeController * webVC = [[YHAXZhuYeController alloc] initWithAddress:YHUserSetting.wangyeLJ];
    webVC.showsToolBar = YES;
    webVC.navigationType = AXWebViewControllerNavigationToolItem;
    if (@available(iOS 9.0, *)) {
        webVC.webView.allowsLinkPreview = YES;
    }
    
    if(YHUserSetting.toolbarpos >= 2){
        //自定义获取 不需要菜单的
        return webVC;
    }else{
        
        YHBaseNavigationController * mainNAVC = [[YHBaseNavigationController alloc] initWithRootViewController:webVC];
        
        UIColor * titleColor = [UIColor blackColor];
        UIImage * image = [UIImage imageWithColor:[UIColor whiteColor]];
        
        [mainNAVC.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [mainNAVC.navigationBar setBarStyle:UIBarStyleDefault];
        [mainNAVC.navigationBar setShadowImage:[UIImage new]];
        [mainNAVC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor,NSFontAttributeName:[UIFont yh_pfmOfSize:16]}];
        [mainNAVC.navigationBar setTintColor:[UIColor whiteColor]];
        [mainNAVC.navigationBar setTranslucent:NO];
        
        
        [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: titleColor,NSFontAttributeName:[UIFont yh_pfmOfSize:16]}];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTranslucent:NO];
        
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        
        return mainNAVC;
    }
}

@end
