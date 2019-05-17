//
//  UIView+YHIB.h
//  ZhuangZhuang
//
//  Created by RY003 on 2019/5/17.
//  Copyright © 2019 ZZL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface UIView (YHIB)

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable BOOL masksToBounds;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, retain) IBInspectable UIColor * borderColor;

@end

NS_ASSUME_NONNULL_END
