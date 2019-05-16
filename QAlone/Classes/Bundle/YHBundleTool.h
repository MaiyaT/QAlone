//
//  YHBundleTool.h
//  Pods
//
//  Created by RY003 on 2019/5/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define QAloneLocalizedString(key) \
NSLocalizedStringFromTableInBundle(key, @"Localizable", [YHBundleTool resourceBundle], nil)

#define QAloneImageByName(name) \
[UIImage imageNamed:name inBundle:[YHBundleTool resourceBundle] compatibleWithTraitCollection:nil]


@interface YHBundleTool : NSObject

+ (NSBundle *)resourceBundle;

@end

NS_ASSUME_NONNULL_END
