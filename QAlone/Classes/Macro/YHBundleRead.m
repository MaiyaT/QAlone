//
//  YHBundleRead.m
//  AFNetworking
//
//  Created by RY003 on 2019/5/15.
//

#import "YHBundleRead.h"

@implementation YHBundleRead



+ (NSBundle *)resourceBundle{

    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resourcePath = [bundle pathForResource:@"QAlone" ofType:@"bundle"] ;
    
    if (resourcePath){
        NSBundle *bundle2 = [NSBundle bundleWithPath:resourcePath];
        if (bundle2){
            bundle = bundle2;
        }
    }
    return bundle;
}

@end
