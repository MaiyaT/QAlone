//
//  YHUserDefaultsSetting.h
//  HonourJJ
//
//  Created by YH003 on 2018/9/6.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

#define YHUserSetting [YHUserDefaultsSetting standardUserDefaults]

/**
 WARN: 添加属性 要再 .m 文件中声名 @dynamic
 set get 方法自己定义
 */

/** APP设置 数据相关*/
@interface YHUserDefaultsSetting : GVUserDefaults

@property (nonatomic, assign) BOOL isWangyeXS;
@property (nonatomic, assign) BOOL isWangyeXSLocal;
@property (nonatomic, copy) NSString * wangyeLJ;
//工具条位置 0底部  1顶部  2自定义 其他不显示
@property (nonatomic, assign) NSInteger toolbarpos;


- (void)saveObj:(id)obj forKey:(NSString *)key;
- (id)getObjByKey:(NSString *)key;


@end

