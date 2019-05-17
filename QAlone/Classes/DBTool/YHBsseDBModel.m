//
//  YHBsseDBModel.m
//  Storybook
//
//  Created by RY003 on 2019/5/10.
//  Copyright © 2019 YH. All rights reserved.
//

#import "YHBsseDBModel.h"

@implementation YHBsseDBModel

+(LKDBHelper *)getUsingLKDBHelper{
    static LKDBHelper* db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *sqlitePath = [YHBsseDBModel yh_downloadPath];
        NSString *dbpath = [sqlitePath stringByAppendingPathComponent:[NSString stringWithFormat:@"YHDB.db"]];
        db = [[LKDBHelper alloc]initWithDBPath:dbpath];
    });
    return db;
}

/**
 *  @brief  路径
 */
+ (NSString *)yh_downloadPath{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *downloadPath = [documentPath stringByAppendingPathComponent:@"YHDB"];
    NSLog(@"================ db path === %@",downloadPath);
    return downloadPath;
}

+ (void)initialize{
    [self removePropertyWithColumnName:@"error"];
}

/**
 *  @brief  是否将父实体类的属性也映射到sqlite库表
 *  @return BOOL
 */
+ (BOOL)isContainParent{
    return YES;
}

/**
 *  @brief  设定表名
 *  @return 返回表名
 */
+ (NSString *)getTableName{
    return NSStringFromClass([self class]);
}

/**
 *  @brief  设定表的单个主键
 *  @return 返回主键表
 */
+ (NSString *)getPrimaryKey{
    return @"itemID";
}

@end





@implementation NSObject(YSGSSQL)

+ (NSString *)getCreateTableSQL{
    LKModelInfos *infos = [self getModelInfos];
    NSString *primaryKey = [self getPrimaryKey];
    NSMutableString *table_pars = [NSMutableString string];
    for (int i = 0; i < infos.count; i++) {
        
        if(i > 0){
            [table_pars appendString:@","];
        }
        LKDBProperty *property =  [infos objectWithIndex:i];
        [self columnAttributeWithProperty:property];
        
        [table_pars appendFormat:@"%@ %@",property.sqlColumnName,property.sqlColumnType];
        
        if([property.sqlColumnType isEqualToString:LKSQL_Type_Text])
        {
            if(property.length>0)
            {
                [table_pars appendFormat:@"(%ld)",(long)property.length];
            }
        }
        if(property.isNotNull)
        {
            [table_pars appendFormat:@" %@",LKSQL_Attribute_NotNull];
        }
        if(property.isUnique)
        {
            [table_pars appendFormat:@" %@",LKSQL_Attribute_Unique];
        }
        if(property.checkValue)
        {
            [table_pars appendFormat:@" %@(%@)",LKSQL_Attribute_Check,property.checkValue];
        }
        if(property.defaultValue)
        {
            [table_pars appendFormat:@" %@ %@",LKSQL_Attribute_Default,property.defaultValue];
            CGSize qizhangdj_translate_line_element = CGSizeMake(623,490);
            NSMutableArray * qizhangdjReplaceDisplay = [NSMutableArray new];
            [qizhangdjReplaceDisplay addObject:@(qizhangdj_translate_line_element)];
            
        }
        if(primaryKey && [property.sqlColumnName isEqualToString:primaryKey])
        {
            [table_pars appendFormat:@" %@",LKSQL_Attribute_PrimaryKey];
        }
    }
    NSString *createTableSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(%@)",[self getTableName],table_pars];
    return createTableSQL;
    
}

@end
