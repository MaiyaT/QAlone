//
//  UIFont+YH.m
//  SuoShi
//
//  Created by YH on 2018/1/24.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "UIFont+YH.h"
#import <YYKit/UIFont+YYAdd.h>

@implementation UIFont (YH)



+ (UIFont *)yh_fontWithName:(NSString *)fontName size:(CGFloat)fontSize{
    fontSize = [UIFont fontSize:fontSize];
    return [UIFont fontWithName:fontName size:fontSize];
}

+ (UIFont *)yh_hnOfSize:(CGFloat)fontSize{
    return [self yh_fontWithName:@"Helvetica" size:fontSize];
}

+ (UIFont *)yh_pfOfSize:(CGFloat)fontSize{
    return [self yh_fontWithName:@"PingFangSC-Regular" size:fontSize];
}

+ (UIFont *)yh_pfmOfSize:(CGFloat)fontSize{
    return [self yh_fontWithName:@"PingFangSC-Medium" size:fontSize];
}

+ (UIFont *)yh_pflOfSize:(CGFloat)fontSize{
    return [self yh_fontWithName:@"PingFangSC-Light" size:fontSize];
}

+ (UIFont *)yh_gbiOfSize:(CGFloat)fontSize{
    return [self yh_fontWithName:@"Georgia-BoldItalic" size:fontSize];
}

+ (UIFont *)yh_ArialHebrewLight:(CGFloat)fontSize{
    return [self yh_fontWithName:@"ArialHebrew-Light" size:fontSize];
}



+(UIFont *)yh_systemFont:(CGFloat)size
{
    return [UIFont systemFontOfSize:[self fontSize:size]];
}

+(UIFont *)yh_boldSystemFont:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:[self fontSize:size]];
}


+(UIFont *)yh_systemFont:(float)size withFontName:(NSString *)fontName{
    UIFont * font = [UIFont fontWithName:fontName size:[self fontSize:size]];
    if(font)
    {
        return font;
    }
    return [UIFont systemFontOfSize:[self fontSize:size]];
}

+ (CGFloat)fontSize:(CGFloat)oldFont{
    oldFont = AdaptedWidth(oldFont);
    return oldFont;
}

+ (void)logAllFonts{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}

@end
