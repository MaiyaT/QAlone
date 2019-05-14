//
//  UIColor+YH.m
//  SuoShi
//
//  Created by YH on 2018/6/6.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "UIColor+YH.h"

@implementation UIColor (YH)


- (UIImage *)yh_drawImage
{
    return [self yh_drawImageBySize:CGSizeMake(10, 10)];
}
- (UIImage *)yh_drawImageBySize:(CGSize)imageSize
{
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [self set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return pressedColorImg;
}



+ (UIColor *)yh_colorByHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)yh_colorByHexString:(NSString *)color
{
    return [self yh_colorByHexString:color alpha:1.0f];
}
+ (UIColor *)yh_colorR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b{
    return [self yh_colorR:r g:g b:b alpha:1];
}
+ (UIColor *)yh_colorR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}



+ (UIColor *)randomColor{
    
    return [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
}


#pragma mark - 渐变

+ (UIColor*)yh_gradientFromColors:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(NSInteger)height{
    return [UIColor yh_gradientFromColors:@[c1,c2] gradCenter:CGPointZero gradRadius:height direction:(YHGradFX_top_down)];
}
+ (UIColor *)yh_gradientFromColors:(UIColor *)c1 toColor:(UIColor *)c2 withWidth:(NSInteger)width{
    return [UIColor yh_gradientFromColors:@[c1,c2] gradCenter:CGPointZero gradRadius:width direction:(YHGradFX_left_right)];
}


+ (UIColor*)yh_gradientFromColors:(NSArray <UIColor*>*)colors gradCenter:(CGPoint)gradCenter gradRadius:(CGFloat)gradRadius direction:(YHGradFX)direction
{
    CGPoint startPoint = gradCenter;
    CGFloat end_x = gradCenter.x;
    CGFloat end_y = gradCenter.y;
    switch (direction) {
        case YHGradFX_top_down:
            end_y = end_y+gradRadius;
            break;
        case YHGradFX_down_top:
            end_y = end_y-gradRadius;
            break;
        case YHGradFX_left_right:
            end_x = end_x+gradRadius;
            break;
        case YHGradFX_right_left:
            end_x = end_x-gradRadius;
            break;
        default:
            break;
    }
    CGPoint endPoint = CGPointMake(end_x, end_y);
    
    CGSize size = CGSizeMake(gradRadius, gradRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSMutableArray * gradColors = [NSMutableArray new];
    for(UIColor * color in colors){
        [gradColors addObject:(id)color.CGColor];
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)gradColors, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
