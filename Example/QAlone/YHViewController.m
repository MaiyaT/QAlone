//
//  YHViewController.m
//  QAlone
//
//  Created by lnn on 05/13/2019.
//  Copyright (c) 2019 lnn. All rights reserved.
//

#import "YHViewController.h"
#import <QAlone/QAlone.h>

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSBundle * bundle = [NSBundle bundleForClass:[YHBundleRead class]];
    
    NSURL *url = [bundle URLForResource:@"AXWebViewController" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];

    
//    NSString * path = [bundle pathForResource:@"QAlone" ofType:@"bundle"];
//    bundle = [NSBundle bundleWithPath:path];
    
    UIImage * image = [UIImage imageNamed:@"navi_icon_back_white" inBundle:bundle compatibleWithTraitCollection:nil];
    NSLog(@"%@",image);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
