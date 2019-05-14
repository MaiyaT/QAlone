//
//  YHBaseTableViewCell.h
//  SuoShi
//
//  Created by YH on 2019/3/2.
//  Copyright © 2019 YH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHBaseTableViewCell : UITableViewCell

- (void)yh_commonInit;
+ (NSString *)yh_cellIdentify;

+ (instancetype)yh_cellStoryBoardWithTableView:(UITableView *)tableV;


@end

NS_ASSUME_NONNULL_END
