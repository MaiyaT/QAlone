//
//  UIScrollView+YHShot.m
//  SuoShi
//
//  Created by 林宁宁 on 2017/3/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

#import "UIScrollView+YHShot.h"

@implementation UIScrollView (YHShot)

-(void)screenShotBlock:(void (^)(UIImage *))block
{
    dispatch_async(dispatch_get_main_queue(), ^{
 
        CGSize contentSize = self.contentSize;
        
        if([self isKindOfClass:[UITextView class]]){
            UITextView * textV = (UITextView *)self;

            CGSize constraintSize = CGSizeMake(CGRectGetWidth(textV.frame), MAXFLOAT);
            contentSize = [textV sizeThatFits:constraintSize];
            contentSize.width = CGRectGetWidth(textV.frame);

            textV.layoutManager.allowsNonContiguousLayout = NO;
        }
        
        CGPoint savedContentOffset = self.contentOffset;
        CGRect savedFrame = self.frame;
        [self setContentOffset:CGPointZero animated:NO];
        self.frame= CGRectMake(0, 0, contentSize.width,contentSize.height);
//        self.contentSize = contentSize;
//        [self layoutSubviews];
        
        UIGraphicsBeginImageContextWithOptions(contentSize,NO,[UIScreen mainScreen].scale);
        
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        
        [self setContentOffset:savedContentOffset animated:NO];
        self.frame= savedFrame;
        
        UIGraphicsEndImageContext();
        
        if(block)
        {
            block(image);
        }
    });
}

@end

