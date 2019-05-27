//
//  YHQueryTool.m
//  YYTouTiao
//
//  Created byRGCSDJ003 on 2019/4/4.
//  Copyright © 2019年 YYTouTiao. All rights reserved.
//

#import "YHQueryTool.h"
#import <AVOSCloud/AVOSCloud.h>
#import "YHUserDefaultsSetting.h"

@implementation YHQueryTool

+ (void)configSettingAppID:(NSString *)appID clientKey:(NSString *)clientKey{
    [AVOSCloud setApplicationId:appID clientKey:clientKey];
}

@end
