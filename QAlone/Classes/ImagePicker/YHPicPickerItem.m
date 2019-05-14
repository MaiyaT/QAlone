//
//  YHPicPickerItem.m
//  ZouYou
//
//  Created byRGCSDJ003 on 2019/3/7.
//  Copyright © 2019年RGCSDJDJ. All rights reserved.
//

#import "YHPicPickerItem.h"

@implementation YHPicPickerItem


-(NSString *)fileName{
    NSInteger temp = [[NSDate date] timeIntervalSince1970]*1000;
    if(self.fileType){
        return [NSString stringWithFormat:@"%zd%d.%@",temp,arc4random()%100000,self.fileType];;
    }
    return [NSString stringWithFormat:@"%zd%d",temp,arc4random()%100000];
}


@end
