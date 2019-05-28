//
//  YHBundleTool.h
//  Pods
//
//  Created by RY003 on 2019/5/16.
//

#import <Foundation/Foundation.h>

#define QAloneLocalizedString(key) (NSLocalizedStringFromTableInBundle(key, @"Localizable", [YHBundleTool resourceBundle], nil))
#define QAloneImageByName(key) ([UIImage imageNamed:key inBundle:[YHBundleTool resourceBundle] compatibleWithTraitCollection:nil])


NS_ASSUME_NONNULL_BEGIN

@interface YHBundleTool : NSObject

+ (NSBundle *)resourceBundle;

@end


NS_ASSUME_NONNULL_END
