//
//  YHBaseCollectionViewCell.h
//  Storybook
//
//  Created by YH on 2019/5/6.
//  Copyright © 2019 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBaseCollectionViewCell : UICollectionViewCell

- (void)yh_commonInit;
+ (NSString *)yh_cellIdentify;

+ (instancetype)yh_cellStoryBoardWithCollectionView:(UICollectionView *)collectionV indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
