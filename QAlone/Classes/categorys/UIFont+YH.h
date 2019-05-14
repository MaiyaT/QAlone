//
//  UIFont+YH.h
//  SuoShi
//
//  Created by YH on 2018/1/24.
//  Copyright © 2018年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YH)

+ (UIFont *)yh_systemFont:(CGFloat)size;
+ (UIFont *)yh_boldSystemFont:(CGFloat)size;
+ (UIFont *)yh_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

+ (UIFont *)yh_hnOfSize:(CGFloat)fontSize;
+ (UIFont *)yh_pfOfSize:(CGFloat)fontSize;
+ (UIFont *)yh_pfmOfSize:(CGFloat)fontSize;
+ (UIFont *)yh_pflOfSize:(CGFloat)fontSize;
+ (UIFont *)yh_gbiOfSize:(CGFloat)fontSize;
+ (UIFont *)yh_ArialHebrewLight:(CGFloat)fontSize;

+ (void)logAllFonts;

@end
