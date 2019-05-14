//
//  NSDate+YH.h
//  SuoShi
//
//  Created by YH on 2018/1/27.
//  Copyright © 2018年 YH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/NSDate+YYAdd.h>

@interface NSDate (YH)

/** 转时间字符串
 为空默认 yyyy-MM-dd HH:mm:ss 格式
 */
- (NSString *)yh_stringWithFormate:(NSString *)formate;
/** 转时间字符串 到天 yyyy-MM-dd HH:mm:ss*/
- (NSString *)yh_striToSecond;
/** 转时间字符串 到天 yyyy-MM-dd*/
- (NSString *)yh_strToDay;
/** 转时间字符串 到天 yyyy-MM*/
- (NSString *)yh_strToMonth;


/** 转时间的中文字符串
 为空默认 yyyy-MM-dd HH:mm:ss 格式
 对应 yyyy年MM月dd日 HH时mm分ss秒
 */
- (NSString *)yh_strCNByFormate:(NSString *)formate;

/** 日期描述：   2017年11月18号 星期六*/
- (NSString *)yh_desYMDW;

/** 日期的标识*/
- (NSString *)yh_dayID;

/** 这个日期是星期几*/
- (NSString *)yh_dateWeekdayMiaoShu;

/** 该月份中有几天*/
- (NSInteger)yh_dayCountAtThisMonth;

@end
