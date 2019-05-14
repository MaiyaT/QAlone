//
//  YHBaseNavigationController.m
//  Keepscores
//
//  Created by YH on 2018/11/19.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "YHBaseNavigationController.h"
#import "UIColor+YH.h"

@interface YHBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation YHBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    
    self.view.backgroundColor  = [UIColor blackColor];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //@{}代表Dictionary
    
    
    [self yh_redrawnavcHeadView];
}

- (void)yh_redrawnavcHeadView
{
    UIColor * skinColor = [UIColor blackColor];
    
    UIColor * navcTitleColor = [UIColor whiteColor];
    
    UIImage * image = [skinColor yh_drawImage];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    UIImage * bgImage = [skinColor yh_drawImage];
    [[UINavigationBar appearance] setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    

    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:navcTitleColor}];
    
    [[UINavigationBar appearance] setTintColor:navcTitleColor];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}
-(BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
