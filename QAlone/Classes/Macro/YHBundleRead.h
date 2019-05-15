//
//  YHBundleRead.h
//  AFNetworking
//
//  Created by RY003 on 2019/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define QAloneLocalizedString(key) \
NSLocalizedStringFromTableInBundle(key, @"Localizable", [YHBundleRead resourceBundle], nil)

#define QAloneImageByName(name) \
[UIImage imageNamed:name inBundle:[YHBundleRead resourceBundle] compatibleWithTraitCollection:nil]


@interface YHBundleRead : NSObject

+ (NSBundle *)resourceBundle;

@end

NS_ASSUME_NONNULL_END
