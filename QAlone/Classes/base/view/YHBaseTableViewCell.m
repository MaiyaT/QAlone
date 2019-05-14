//
//  YHBaseTableViewCell.m
//  SuoShi
//
//  Created by YH on 2019/3/2.
//  Copyright © 2019 YH. All rights reserved.
//

#import "YHBaseTableViewCell.h"

@implementation YHBaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self yh_commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self yh_commonInit];
    }
    return self;
}


- (void)yh_commonInit{
    
}

+ (NSString *)yh_cellIdentify{
    return [NSString stringWithFormat:@"%@ID",NSStringFromClass([self class])];
}


+ (instancetype)yh_cellStoryBoardWithTableView:(UITableView *)tableV{
    NSString * yh_cellIdentify = [[self class] yh_cellIdentify];
    YHBaseTableViewCell * cell = [tableV dequeueReusableCellWithIdentifier:yh_cellIdentify];
    if(!cell){
        cell = [[NSBundle mainBundle] loadNibNamed:yh_cellIdentify owner:nil options:nil].firstObject;
    }
    return cell;
}

@end
