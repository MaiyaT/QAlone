//
//  YHBundleTool.h
//  Pods
//
//  Created by RY003 on 2019/5/16.
//

#import <Foundation/Foundation.h>

#define QAloneLocalizedString(key) [YHBundleTool QAloneLocalizedString:key]
#define QAloneImageByName(key) [YHBundleTool QAloneImageByName:key]


NS_ASSUME_NONNULL_BEGIN

@interface YHBundleTool : NSObject

+ (NSBundle *)resourceBundle;

+ (NSString *)QAloneLocalizedString:(NSString *)key;


+ (UIImage *)QAloneImageByName:(NSString *)key;

@end


NS_ASSUME_NONNULL_END
