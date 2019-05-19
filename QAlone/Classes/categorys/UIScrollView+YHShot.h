//
//  UIScrollView+YHShot.h
//  SuoShi
//
//  Created by 林宁宁 on 2017/3/28.
//  Copyright © 2017年 林宁宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YHShot)

- (void)screenShotBlock:(void(^)(UIImage * image))block;

@end

