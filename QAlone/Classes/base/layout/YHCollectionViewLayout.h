//
//  YHCollectionViewLayout.h
//  QAlone
//
//  Created by RY003 on 2019/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YHCollectionViewLayoutDelegate;

@interface YHCollectionViewLayout : UICollectionViewLayout


@property (assign,nonatomic)CGFloat columnMargin;//每一列item之间的间距
@property (assign,nonatomic)CGFloat rowMargin;   //每一行item之间的间距
@property (assign,nonatomic)UIEdgeInsets sectionInset;//设置于collectionView边缘的间距
@property (assign,nonatomic)NSInteger columnCount;//设置每一行排列的个数

//@property (weak, nonatomic) IBOutlet UICollectionView *collectionV;
@property (weak,nonatomic)IBOutlet id<YHCollectionViewLayoutDelegate> delegate; //设置代理

@end


@protocol YHCollectionViewLayoutDelegate <NSObject>

@optional

- (CGFloat)yh_flowLayoutHeight:(YHCollectionViewLayout *)flowLayout
                    andIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)yh_flowLayoutWidth:(YHCollectionViewLayout *)flowLayout
                   andIndexPath:(NSIndexPath *)indexPath;



@end


NS_ASSUME_NONNULL_END
