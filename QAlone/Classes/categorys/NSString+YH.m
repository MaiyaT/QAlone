//
//  NSString+YH.m
//  Storybook
//
//  Created by RY003 on 2019/5/10.
//  Copyright © 2019 YH. All rights reserved.
//

#import "NSString+YH.h"

@implementation NSString (YH)


-(NSString *)yh_getTimeDesFromSecond{
    
    NSInteger seconds = [self integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02zd",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02zd",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02zd",seconds%60];
    
    return [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
}

@end
