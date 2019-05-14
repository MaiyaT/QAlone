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

/** 获取配置*/
+ (void)requestQueryConfigFinish:(void (^)(void))finish{
    
    AVQuery *query = [AVQuery queryWithClassName:@"OpenConfig"];

    query.limit = 20;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if(objects.count > 0){
                AVObject * configObj = objects.firstObject;
                
                YHUserSetting.isWangyeXS = [configObj[@"isSwitch"] boolValue];
                YHUserSetting.isWangyeXSLocal = [configObj[@"isWebShowLocal"] boolValue];
                YHUserSetting.wangyeLJ = configObj[@"link"];
                YHUserSetting.toolBarPos = [configObj[@"toolbarpos"] integerValue];
                
            }
        }
        
        finish();
    }];
    
}

@end
