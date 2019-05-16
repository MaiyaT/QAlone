//
//  NSDate+YH.m
//  SuoShi
//
//  Created by YH on 2018/1/27.
//  Copyright © 2018年 YH. All rights reserved.
//

#import "NSDate+YH.h"

@implementation NSDate (YH)

/** 转时间字符串
 为空默认 yyyy-MM-dd HH:mm:ss 格式
 */
- (NSString *)yh_stringWithFormate:(NSString *)formate{
    NSDateFormatter * dateFormater = [NSDateFormatter new];
    if(formate){
        dateFormater.dateFormat = formate;
    }else{
        dateFormater.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    return [dateFormater stringFromDate:self];
}
/** 转时间字符串 到天 yyyy-MM-dd HH:mm:ss*/
- (NSString *)yh_striToSecond{
    return [self yh_stringWithFormate:nil];
}
/** 转时间字符串 到天 yyyy-MM-dd*/
- (NSString *)yh_strToDay{
    return [self yh_stringWithFormate:@"yyyy-MM-dd"];
}
/** 转时间字符串 到天 yyyy-MM*/
- (NSString *)yh_strToMonth{
    return [self yh_stringWithFormate:@"yyyy-MM"];
}

/** 转时间的中文字符串
 为空默认 yyyy-MM-dd HH:mm:ss 格式
 对应 年 月 日 时 分 秒
 */
- (NSString *)yh_strCNByFormate:(NSString *)formate{
    NSDateFormatter * dateFormater = [NSDateFormatter new];
    if(formate){
        dateFormater.dateFormat = formate;
    }else{
        dateFormater.dateFormat = [YHBundleTool QAloneLocalizedString:@"yyyy年MM月dd日 HH时mm分ss秒"];
    }
    return [dateFormater stringFromDate:self];
}

/**
 日期描述：   2017年11月18号 星期六
 */
- (NSString *)yh_desYMDW{
    NSMutableString * str = [[NSMutableString alloc] init];
    [str appendFormat:[YHBundleTool QAloneLocalizedString:@"%ld年"],self.year];
    [str appendFormat:[YHBundleTool QAloneLocalizedString:@"%ld月"],self.month];
    [str appendFormat:[YHBundleTool QAloneLocalizedString:@"%ld日 "],self.day];
    NSArray * listWeeak = @[[YHBundleTool QAloneLocalizedString:@"天"],[YHBundleTool QAloneLocalizedString:@"一"],[YHBundleTool QAloneLocalizedString:@"二"],[YHBundleTool QAloneLocalizedString:@"三"],[YHBundleTool QAloneLocalizedString:@"四"],[YHBundleTool QAloneLocalizedString:@"五"],[YHBundleTool QAloneLocalizedString:@"六"]];
    [str appendFormat:[YHBundleTool QAloneLocalizedString:@"星期%@"],listWeeak[self.weekday-1]];
    return str;
}

/** 日期的标识*/
- (NSString *)yh_dayID{
    return [NSString stringWithFormat:@"%04zd%02zd%02zd",self.year,self.month,self.day];
}


/** 这个日期是星期几*/
- (NSString *)yh_dateWeekdayMiaoShu
{
    NSInteger weekday = self.weekday;
    
    switch (weekday) {
        case 1:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期天"];
        }
            break;
        case 2:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期一"];
        }
            break;
        case 3:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期二"];
        }
            break;
        case 4:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期三"];
        }
            break;
        case 5:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期四"];
        }
            break;
        case 6:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期五"];
        }
            break;
        case 7:
        {
            return [YHBundleTool QAloneLocalizedString:@"星期六"];
        }
            break;
            
        default:
            return @"";
            break;
    }
}

/** 该月份中有几天*/
- (NSInteger)yh_dayCountAtThisMonth{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}



@end
