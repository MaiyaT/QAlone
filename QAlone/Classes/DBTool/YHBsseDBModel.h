//
//  YHBsseDBModel.h
//  Storybook
//
//  Created by RY003 on 2019/5/10.
//  Copyright © 2019 YH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LKDBHelper/LKDBHelper.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBsseDBModel : NSObject

@property (assign, nonatomic) NSInteger itemID;

@end

//这个NSOBJECT的扩展类 可以查看详细的建表sql语句

@interface NSObject(YSGSSQL)
+ (NSString *)getCreateTableSQL;
@end

NS_ASSUME_NONNULL_END
