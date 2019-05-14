//
//  UIButton+Block.m
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIButton+JKBlock.h"
#import <objc/runtime.h>
static const void *jk_UIButtonBlockKey = &jk_UIButtonBlockKey;
static const void *jk_UIButtonDownBlockKey = &jk_UIButtonDownBlockKey;
static const void *rgcsdj_UIButtonBlockKey = &rgcsdj_UIButtonBlockKey;

@implementation UIButton (jk_Block)
-(void)jk_addActionHandler:(JKTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, jk_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(jk_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)jk_blockActionTouched:(UIButton *)btn{
    JKTouchedButtonBlock block = objc_getAssociatedObject(self, jk_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}


-(void)jk_addActionTouchDownHandler:(void (^)(UIButton *, NSInteger))touchHandler{
    objc_setAssociatedObject(self, jk_UIButtonDownBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(jk_blockActionTouchDown:) forControlEvents:UIControlEventTouchDown];
}
-(void)jk_blockActionTouchDown:(UIButton *)btn{
    void(^block)(UIButton * btn, NSInteger index) = objc_getAssociatedObject(self, jk_UIButtonDownBlockKey);
    if (block) {
        block(btn,btn.tag);
    }
}

-(void)rgcsdj_addActionHandler:(void (^)(UIButton *))touchHandler{
    objc_setAssociatedObject(self, rgcsdj_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(rgcsdj_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)rgcsdj_blockActionTouched:(UIButton *)btn{
    void(^block)(UIButton *) = objc_getAssociatedObject(self, rgcsdj_UIButtonBlockKey);
    if (block) {
        block(btn);
    }
}
@end

