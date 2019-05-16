//
//  YHViewController.m
//  QAlone
//
//  Created by lnn on 05/13/2019.
//  Copyright (c) 2019 lnn. All rights reserved.
//

#import "YHViewController.h"
#import <QAlone/YHBundleTool.h>

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    NSBundle * bundle = [NSBundle bundleForClass:[YHBundleTool class]];
//    
//    NSURL *url = [bundle URLForResource:@"QAlone" withExtension:@"bundle"];
//    bundle = [NSBundle bundleWithURL:url];

    
//    NSString * path = [bundle pathForResource:@"QAlone" ofType:@"bundle"];
//    bundle = [NSBundle bundleWithPath:path];
    
    UIImage * image = QAloneImageByName(@"navi_icon_back_white");
    NSLog(@"%@",image);
    
    NSString * queding = QAloneLocalizedString(@"确定");
    NSLog(@"%@",queding);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
