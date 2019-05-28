//
//  YHBundleTool.m
//  Pods
//
//  Created by RY003 on 2019/5/16.
//

#import "YHBundleTool.h"

@implementation YHBundleTool

+ (NSBundle *)resourceBundle{
    
    NSBundle * bundle = [NSBundle bundleForClass:[YHBundleTool class]];
    
    NSURL *url = [bundle URLForResource:@"Q" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];
    
    return bundle;
}

+ (NSString *)QAloneLocalizedString:(NSString *)key{
    return NSLocalizedStringFromTableInBundle(key, @"Localizable", [YHBundleTool resourceBundle], nil);
}

+ (UIImage *)QAloneImageByName:(NSString *)key{
    return [UIImage imageNamed:key inBundle:[YHBundleTool resourceBundle] compatibleWithTraitCollection:nil];
}

@end
