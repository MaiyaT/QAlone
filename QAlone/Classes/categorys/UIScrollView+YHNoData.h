//
//  UIScrollView+YHNoData.h
//  HonourJJ
//
//  Created by RY003 on 2018/7/27.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@class YHDZNEmptyDelegate;

/** 无数据提醒*/
@interface UIScrollView (YHNoData)

@property (retain, nonatomic) YHDZNEmptyDelegate * emptyDelegate;
- (void)emptyBtnConfig:(void (^)(YHDZNEmptyDelegate * delegate))configBlock btnClickBlock:(void(^)(void))btnClickBlock;

//默认 贴图 nodata_n
- (void)emptyConfig:(void(^)(YHDZNEmptyDelegate * delegate))configBlock;

- (void)reloadEmpty;

@end


@interface YHDZNEmptyDelegate : NSObject<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

/*image*/
@property (nonatomic,strong) NSString *imageUrlString;

/*vertical*/
@property (nonatomic,assign) CGFloat   verticalOffset;
@property (nonatomic,assign) UIEdgeInsets capInsets;

/*actionBlock*/
@property (nonatomic,copy) void (^clickEmptyViewBlock)(void);

/*subTitle*/
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSString *buttonBgImageName;/* 背景图 */
@property (nonatomic,assign) UIEdgeInsets rectInsets;
@property (nonatomic,strong) UIFont   *subTitleFont;

/*UIButton*/
@property (nonatomic,strong) NSString *buttonTitle;
@property (nonatomic,strong) UIFont   *titleFont;

/*title*/
@property (nonatomic,strong) NSString *title;

/* elements间距 */
@property (nonatomic,assign) CGFloat   spaceHeight;
@property (nonatomic,strong) UIColor  *subTitleColor;

/** 手动控制是否为空 显示*/
@property (nonatomic, retain) NSNumber * shouldShowEmpty;
@property (nonatomic,strong) UIColor  *titleColor;
@property (nonatomic,strong) UIColor  *buttonColor;/* 字体颜色 */
@property (nonatomic,strong) UIFont   *buttonFont;
@property (nonatomic,copy) void (^clickEmptyBtnBlock)(void);


@end


