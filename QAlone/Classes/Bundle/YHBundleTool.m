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
    
    NSURL *url = [bundle URLForResource:@"QAlone" withExtension:@"bundle"];
    bundle = [NSBundle bundleWithURL:url];
    
    return bundle;
}


@end
