//
//  UIColor+YH.h
//  SuoShi
//
//  Created by YH on 2018/6/6.
//  Copyright © 2018年 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YHGradFX) {
    YHGradFX_top_down,
    YHGradFX_down_top,
    YHGradFX_left_right,
    YHGradFX_right_left,
};


#define YHHexColor(x)       [UIColor yh_colorByHexString:x]
#define YHRGB(rr,gg,bb)        [UIColor yh_colorR:rr g:gg b:bb]

@interface UIColor (YH)



- (UIImage *)yh_drawImage;
- (UIImage *)yh_drawImageBySize:(CGSize)imageSize;

+ (UIColor *)yh_colorByHexString:(NSString *)color;
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)yh_colorByHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)yh_colorR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;
+ (UIColor *)yh_colorR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;;



+ (UIColor*)yh_gradientFromColors:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(NSInteger)height;
+ (UIColor *)yh_gradientFromColors:(UIColor *)c1 toColor:(UIColor *)c2 withWidth:(NSInteger)width;
/**
 渐变
 @param gradCenter 中心点
 @param gradRadius 半径
 @param direction 方向
 */
+ (UIColor*)yh_gradientFromColors:(NSArray <UIColor*>*)colors gradCenter:(CGPoint)gradCenter gradRadius:(CGFloat)gradRadius direction:(YHGradFX)direction;


+ (UIColor *)randomColor;



@end
