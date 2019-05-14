//
//  YHBaseCollectionViewCell.m
//  Storybook
//
//  Created by YH on 2019/5/6.
//  Copyright © 2019 YH. All rights reserved.
//

#import "YHBaseCollectionViewCell.h"

@implementation YHBaseCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
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


+ (instancetype)yh_cellStoryBoardWithCollectionView:(UICollectionView *)collectionV indexPath:(NSIndexPath *)indexPath{
    NSString * yh_cellIdentify = [[self class] yh_cellIdentify];
    YHBaseCollectionViewCell * cell = [collectionV dequeueReusableCellWithReuseIdentifier:yh_cellIdentify forIndexPath:indexPath];
    if(!cell){
        cell = [[NSBundle mainBundle] loadNibNamed:yh_cellIdentify owner:nil options:nil].firstObject;
    }
    return cell;
}

@end
