//
//  UIView+YHIB.m
//  ZhuangZhuang
//
//  Created by RY003 on 2019/5/17.
//  Copyright © 2019 ZZL. All rights reserved.
//

#import "UIView+YHIB.h"

@implementation UIView (YHIB)

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
}
-(CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

-(void)setMasksToBounds:(BOOL)masksToBounds{
    self.layer.masksToBounds = masksToBounds;
}
-(BOOL)masksToBounds{
    return self.layer.masksToBounds;
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}
-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}
-(CGFloat)borderWidth{
    return self.layer.borderWidth;
}


@end
