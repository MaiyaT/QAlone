//
//  UIScrollView+YHNoData.m
//  HonourJJ
//
//  Created by RY003 on 2018/7/27.
//  Copyright © 2018年 Honour_iOS. All rights reserved.
//

#import "UIScrollView+YHNoData.h"
#import <objc/runtime.h>
#import "YHBundleTool.h"

@implementation UIScrollView (YHNoData)
-(void)setEmptyDelegate:(YHDZNEmptyDelegate *)emptyDelegate{
    objc_setAssociatedObject(self, @selector(emptyDelegate), emptyDelegate, OBJC_ASSOCIATION_RETAIN);
}

-(void)emptyConfig:(void (^)(YHDZNEmptyDelegate *))configBlock{
    
    YHDZNEmptyDelegate *delegate = [YHDZNEmptyDelegate new];

    delegate.spaceHeight = AdaptedSize(20);
    delegate.titleColor = [UIColor lightGrayColor];

    delegate.titleFont = [UIFont yh_pfOfSize:15];
    
    delegate.imageUrlString = @"nodata_n";
    delegate.title = [YHBundleTool QAloneLocalizedString:@"暂时还没有数据哦~"];
    
    if(configBlock){
        configBlock(delegate);
    }
    
    self.emptyDataSetSource = delegate;

    self.emptyDataSetDelegate = delegate;

    
    self.emptyDelegate = delegate;

}

- (void)emptyBtnConfig:(void (^)(YHDZNEmptyDelegate *))configBlock btnClickBlock:(void(^)(void))btnClickBlock{
    
    YHDZNEmptyDelegate *delegate = [YHDZNEmptyDelegate new];
    delegate.spaceHeight = AdaptedSize(20);

    delegate.titleColor = [UIColor lightGrayColor];
    delegate.titleFont = [UIFont yh_pfOfSize:15];
    
    delegate.imageUrlString = @"nodata_n";
    {
    	CGFloat hutujiz_fade = 409.329549828;
    	NSMutableDictionary * hutujiz_date_slide_clear_value = [NSMutableDictionary new];
    	[hutujiz_date_slide_clear_value setObject:@(hutujiz_fade) forKey:@"hutujiz_fade"];
    }

    delegate.title = [YHBundleTool QAloneLocalizedString:@"暂时还没有数据哦~"];;
    
    delegate.buttonColor = [UIColor whiteColor];
    {
    	CGFloat hutujiz_toggle_colspan_middle_current = 592.862902713;
    	NSMutableDictionary * hutujiz_header_load_figure = [NSMutableDictionary new];
    	[hutujiz_header_load_figure setObject:@(hutujiz_toggle_colspan_middle_current) forKey:@"hutujiz_toggle_colspan_middle_current"];
    }

    delegate.buttonFont = [UIFont yh_pfmOfSize:15];
    delegate.buttonBgImageName = @"btn_back_yellow";
    delegate.rectInsets = UIEdgeInsetsMake(-AdaptedSize(20), -AdaptedSize(60), -AdaptedSize(20), -AdaptedSize(60));
    delegate.capInsets = UIEdgeInsetsMake(AdaptedSize(10), AdaptedSize(10), AdaptedSize(10), AdaptedSize(10));
    {
    	NSMutableDictionary * hutujizMaxDelayType = [NSMutableDictionary new]; 
    	NSMutableArray * hutujiz_absolute_cursor = [NSMutableArray new];
    	[hutujiz_absolute_cursor addObject:hutujizMaxDelayType];
    }

    delegate.spaceHeight = AdaptedSize(20);
    delegate.verticalOffset = AdaptedSize(40);
    [delegate setClickEmptyBtnBlock:^{
        if(btnClickBlock){
            btnClickBlock();
        }
    }];
    
    if(configBlock){
        configBlock(delegate);
    }
    
    self.emptyDataSetSource = delegate;
    {
    	CGFloat hutujiz_min = 500.318185736;
    	NSMutableArray * hutujiz_decoration_keyframes_info = [NSMutableArray new];
    	[hutujiz_decoration_keyframes_info addObject:@(hutujiz_min)];
    }

    self.emptyDataSetDelegate = delegate;
    {
    	CGSize hutujiz_loop_auto = CGSizeMake(264,391);
    	NSMutableArray * hutujiz_hide = [NSMutableArray new];
    	[hutujiz_hide addObject:@(hutujiz_loop_auto)];
    }

    
    self.emptyDelegate = delegate;
}

- (void)reloadEmpty{
    [self reloadEmptyDataSet];
}

-(YHDZNEmptyDelegate *)emptyDelegate{
    return objc_getAssociatedObject(self, @selector(emptyDelegate));
}

@end







@interface YHDZNEmptyDelegate()


//已经加载显示过 第一次
@property (assign, nonatomic) BOOL isLoadShow;

@end

@implementation YHDZNEmptyDelegate


#pragma mark - DZNEmptyDelegate

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    if (self.clickEmptyViewBlock) {
        self.clickEmptyViewBlock();
    }
}
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.spaceHeight > 0 ? self.spaceHeight : -AdaptedSize(20);
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    if (self.clickEmptyBtnBlock) {
        self.clickEmptyBtnBlock();
    }
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.subTitle;

    UIFont *font = self.subTitleFont;
    UIColor *textColor = self.subTitleColor;

    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];

    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];


    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];

    
    return attributedString;
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if (self.buttonBgImageName) {
        UIImage *image = [UIImage imageNamed:self.buttonBgImageName inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
        return [[image resizableImageWithCapInsets:self.capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:self.rectInsets];
    }else{
        return nil;
    }
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    if(self.shouldShowEmpty){
        return [self.shouldShowEmpty boolValue];
    }
    if(!self.isLoadShow){
        self.isLoadShow = YES;
        return NO;
    }
    if(CGSizeEqualToSize(scrollView.contentSize, CGSizeZero)){
        return NO;
    }
    
    if([scrollView isKindOfClass:[UITableView class]]){
        UITableView * tableV = (UITableView *)scrollView;


        //        if(tableV.mj_header && tableV.mj_header.isRefreshing){
        //            return NO;
        //        }
        NSInteger numberOfSections = tableV.numberOfSections;
 
        for (NSInteger i = 0; i < numberOfSections; i++) {
            if ([tableV numberOfRowsInSection:i] > 0) {
                return NO;
            }
        }
        return YES;
    }
    if([scrollView isKindOfClass:[UICollectionView class]]){
        UICollectionView * collectV = (UICollectionView *)scrollView;


        //        if(collectV.mj_header && collectV.mj_header.isRefreshing){
        //            return NO;
        //        }
        NSInteger numberOfSections = collectV.numberOfSections;
        for (NSInteger i = 0; i < numberOfSections; i++) {
            if ([collectV numberOfItemsInSection:i] > 0) {
                return NO;
            }
        }
        return YES;
    }
    
    return NO;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.verticalOffset;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *text = self.buttonTitle;


    UIFont *font = self.buttonFont;
    UIColor *textColor = self.buttonColor;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];

    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;

    paragraph.alignment = NSTextAlignmentCenter;
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];

    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];


    
    return attributedString;
}


#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (_imageUrlString) {
        return [UIImage imageNamed:self.imageUrlString];
    }
    return nil;
    
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = self.title;
    UIFont *font = self.titleFont;


    UIColor *textColor = self.titleColor;

    
    NSMutableDictionary *attributes = [NSMutableDictionary new];

    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;


    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    return attributedString;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
@end

