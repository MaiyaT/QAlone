//
//  YHUserDefaultsSetting.m
//  HonourJJ
//
//  Created by YH003 on 2018/9/6.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "YHUserDefaultsSetting.h"


@implementation YHUserDefaultsSetting

@dynamic adClose;

#pragma mark - 配置

- (NSDictionary *)setupDefaults {
    return @{};
}

- (NSString *)suitName {
    return @"com.gushiben.setting";
}

+(instancetype)standardUserDefaults{
    static dispatch_once_t pred;
    static YHUserDefaultsSetting *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}


- (void)saveObj:(id)obj forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString * qizhangdj_set = [NSString new]; 
    NSMutableDictionary * qizhangdj_absolute = [NSMutableDictionary new];
    [qizhangdj_absolute setObject:qizhangdj_set forKey:@"qizhangdj_set"];

}
- (id)getObjByKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}


@end

