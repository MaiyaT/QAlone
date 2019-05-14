//
//  YHAppDelegate.m
//  Keepscores
//
//  Created by YH on 2018/11/18.
//  Copyright © 2018 YH. All rights reserved.
//

#import "YHAppDelegate.h"

@implementation YHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow * mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = mainWindow;

    [self yh_didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}


- (void)yh_didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
}


@end
