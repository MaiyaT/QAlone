//
//  YHQueryTool.h
//  YYTouTiao
//
//  Created byRGCSDJ003 on 2019/4/4.
//  Copyright © 2019年 YYTouTiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHQueryTool : NSObject

+ (void)configSettingAppID:(NSString *)appID clientKey:(NSString *)clientKey;

/** 获取配置*/
+ (void)requestQueryConfigFinish:(void(^)(void))finish;




@end

NS_ASSUME_NONNULL_END
