//
//  YHBaseViewController.m
//  LinTool
//
//  Created by YH on 15/9/21.
//  Copyright © 2015年 000. All rights reserved.
//

#import "YHBaseViewController.h"
#import <objc/runtime.h>

@interface YHBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation YHBaseViewController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yh_colorByHexString:@"0a1115"];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self yh_setLeftPopback];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
        
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    返回问题
    
  
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
    [self.navigationController.view endEditing:YES];
    
    
    [super viewWillDisappear:animated];

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    
    if(!self.parentViewController)
    {
        objc_removeAssociatedObjects(self.view);
        objc_removeAssociatedObjects(self);
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

-(void)viewDidLayoutSubviews{
    if(SystemVersion < 11){
        return;
    }
    UINavigationItem * item=self.navigationItem;
    NSArray * array=item.leftBarButtonItems;
    if (array&&array.count!=0){
        //这里需要注意,你设置的第一个leftBarButtonItem的customeView不能是空的,也就是不要设置UIBarButtonSystemItemFixedSpace这种风格的item
        UIBarButtonItem * buttonItem=array[0];
        UIView * view =[[[buttonItem.customView superview] superview] superview];
        NSArray * arrayConstraint=view.constraints;
        for (NSLayoutConstraint * constant in arrayConstraint) {
            if (fabs(constant.constant)==16) {
                constant.constant=0;
            }
        }
    }
}

/**
 *  设置返回的按钮
 */
- (void)yh_setLeftPopback
{
    [self yh_setLeftNavigationItemBarWithImg:@"navi_icon_back_white" andSelectImg:nil andTitle:nil andSelectTitle:nil andEvent:@selector(yh_backEvent) andTarget:self  andFinishBlock:^(UIButton * sender) {
        
        
    }];
}


- (void)yh_backEvent
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - FBKVO

-(FBKVOController *)yh_kvoC{
    if(!_yh_kvoC){
        _yh_kvoC = [FBKVOController controllerWithObserver:self];
    }
    return _yh_kvoC;
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(LS(@"#########________释放视图%@_________#########"),NSStringFromClass([self class]));
}


- (void)didReceiveMemoryWarning {
    
    NSLog(LS(@"收到内存警告%@"),NSStringFromClass([self class]));
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
