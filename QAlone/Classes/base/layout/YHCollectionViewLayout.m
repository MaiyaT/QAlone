//
//  YHCollectionViewLayout.m
//  QAlone
//
//  Created by RY003 on 2019/5/14.
//

#import "YHCollectionViewLayout.h"

@interface YHCollectionViewLayout()

/** 这个字典用来存储每一列item的高度 */
@property (strong,nonatomic)NSMutableDictionary *maxYDic;
/** 存放每一个item的布局属性 */
@property (strong,nonatomic)NSMutableArray *attrsArray;

@end

@implementation YHCollectionViewLayout


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        self.columnCount = 2;
        
        self.maxYDic = [NSMutableDictionary new];
        self.attrsArray = [NSMutableArray new];
    }
    return self;
}

//初始化
-(instancetype)init
{
    if (self = [super init]){
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        self.columnCount = 2;
        
        self.maxYDic = [NSMutableDictionary new];
        self.attrsArray = [NSMutableArray new];
    }
    return self;
}

-(void)prepareLayout{
    [super prepareLayout];
    
    //清空最大的y值
    for (int i =0; i < self.columnCount; i++)
    {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        self.maxYDic[column] = @(self.sectionInset.top);
    }
    
    //计算所有item的属性
    [self.attrsArray removeAllObjects];
    
    NSInteger section = [self.collectionView numberOfSections];
    for(NSInteger sec = 0; sec < section; sec++){
        NSInteger count = [self.collectionView numberOfItemsInSection:sec];
        for (int i=0; i<count; i++)
        {
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:sec]];
            
            [self.attrsArray addObject:attrs];
        }
    }
}


//设置collectionView滚动区域
-(CGSize)collectionViewContentSize
{
    //假设最长的那一列为第0列
    __block NSString *maxColumn = @"0";
    
    //遍历字典,找出最长的那一列
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        
        if ([maxY floatValue] > [self.maxYDic[maxColumn] floatValue])
        {
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDic[maxColumn]floatValue]+self.sectionInset.bottom);
}

//允许每一次重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//布局每一个属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //假设最短的那一列为第0列
    __block NSString *minColumn = @"0";
    
    if(indexPath.row == 0){
        //是一个新的section 找出最长的
        [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
            
            if ([maxY floatValue] > [self.maxYDic[minColumn] floatValue])
            {
                minColumn = column;
            }
        }];
    }else{
        //遍历字典,找出最短的那一列
        [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
            
            if ([maxY floatValue] < [self.maxYDic[minColumn] floatValue])
            {
                minColumn = column;
            }
        }];
    }
    
    //计算每一个item的宽度和高度
    CGFloat width = (self.collectionView.frame.size.width - self.columnMargin*(self.columnCount - 1) - self.sectionInset.left - self.sectionInset.right) / self.columnCount;
    CGFloat height = width;
    
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(yh_flowLayoutHeight:andIndexPath:)]){
            CGFloat yh_height = [self.delegate yh_flowLayoutHeight:self andIndexPath:indexPath];
            if(yh_height >= 0){
                height = yh_height;
            }
        }
        if([self.delegate respondsToSelector:@selector(yh_flowLayoutWidth:andIndexPath:)]){
            CGFloat yh_width = [self.delegate yh_flowLayoutWidth:self andIndexPath:indexPath];
            if(yh_width >= 0){
                width = yh_width;
            }
        }
    }
    
    //计算每一个item的位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn floatValue];
    CGFloat y = [self.maxYDic[minColumn] floatValue] + self.rowMargin;
    
    
    //更新这一列的y值
    self.maxYDic[minColumn] = @(y + height);
    if(width > CGRectGetWidth(self.collectionView.frame)*0.7){
        for(NSInteger i = 0; i<self.columnCount; i++){
            self.maxYDic[@(i).stringValue] = @(y + height);
        }
    }
    
    //创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //设置item的frame
    attrs.frame = CGRectMake(x, y, width, height);
    
    return attrs;
}

//布局所有item的属性,包括header、footer
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}


@end
