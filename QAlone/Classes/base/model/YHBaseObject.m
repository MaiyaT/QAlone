//
//  YHBaseObject.m
//  SuoShi
//
//  Created by YH on 2018/11/8.
//  Copyright © 2018 YH. All rights reserved.
//

#import "YHBaseObject.h"

@implementation YHBaseObject

-(instancetype)init{
    self = [super init];
    if(self){
        [self yh_commonInit];
    }
    return self;
}

- (void)yh_commonInit{
    
}

-(void)dealloc{
    NSLog(@"dealloc == %@",NSStringFromClass([self class]));
}

@end
