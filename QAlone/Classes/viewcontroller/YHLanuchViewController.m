//
//  YHLanuchViewController.m
//  HonourJJ
//
//  Created by YH on 2018/4/3.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHLanuchViewController.h"

@interface YHLanuchViewController ()

@property (retain, nonatomic) UIImageView * lanuchImageV;

@end

@implementation YHLanuchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage * imageLaunch = [self yh_getTheLaunchImage];
    
    if(imageLaunch){
        self.lanuchImageV = [[UIImageView alloc] init];
        self.lanuchImageV.contentMode = UIViewContentModeScaleAspectFill;
        self.lanuchImageV.image = imageLaunch;
        [self.view addSubview:self.lanuchImageV];
        
        [self.lanuchImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }else{
        UIViewController * launchVC = [self yh_nibLaunchViewController];
        if(launchVC){
            [self.view addSubview:launchVC.view];
            [launchVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.view);
            }];
        }
    }
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)yh_getTheLaunchImage
{
    CGSize viewSize = self.view.bounds.size;
    NSString* viewOrientation = @"Portrait";
    UIDeviceOrientation orientation = (UIDeviceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    if (UIDeviceOrientationIsLandscape(orientation)) {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) &&
            [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
            return [UIImage imageNamed:dict[@"UILaunchImageName"]];
    }
    return nil;
    
}

- (UIViewController *)yh_nibLaunchViewController {
    UIViewController *launchViewController = nil;
    NSString *storyboardName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"UILaunchStoryboardName"];
    if ([storyboardName length] > 0) {
        @try {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
            launchViewController = [storyboard instantiateInitialViewController];
        } @catch (NSException *exception) {
        }
        
        if (!launchViewController) {
            @try {
                UIView *view = [[[NSBundle mainBundle] loadNibNamed:storyboardName owner:nil options:nil] firstObject];
                [view setFrame:[UIScreen mainScreen].bounds];
                launchViewController = [UIViewController new];
                [launchViewController.view addSubview:view];
            } @catch (NSException *exception) {
            }
        }
    }
    
    return launchViewController;
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
