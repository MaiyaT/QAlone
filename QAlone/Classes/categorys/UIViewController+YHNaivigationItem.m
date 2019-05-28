//
//  UIViewController+YHNaivigationItem.m
//  SuoShi
//
//  Created by YH on 2017/3/15.
//  Copyright © 2017年 YH. All rights reserved.
//

#import "UIViewController+YHNaivigationItem.h"
#import "UIFont+YH.h"
#import "YHBundleTool.h"

@implementation UIViewController (YHNaivigationItem)

-(void)yh_setLeftNavigationItemBarWithImg:(NSString *)imgURL andSelectImg:(NSString *)imgSelect andTitle:(NSString *)title andSelectTitle:(NSString *)selectTitle andEvent:(SEL)event andTarget:(id)target andFinishBlock:(void (^)(UIButton *))barBtnBlock
{
    self.navigationItem.leftBarButtonItems = @[];
    NSMutableArray * items = [NSMutableArray new];
    
    NSString *imgPath = imgURL;
    NSString *imgPathSelect = imgSelect;
    
    UIImage * imageNormal = [UIImage imageNamed:imgPath];
    UIImage * imageSelect = [UIImage imageNamed:imgPathSelect];

    if(!imageNormal){
        imageNormal = QAloneImageByName(imgPath);
    }
    if(!imageSelect){
        imageSelect = QAloneImageByName(imgPathSelect);
    }
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.titleLabel.font = [UIFont yh_systemFont:14];
    [leftButton setImage:imageNormal forState:UIControlStateNormal];
    [leftButton setImage:imageSelect forState:UIControlStateSelected];
    
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton setTitle:selectTitle forState:UIControlStateSelected];
    
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if(event){
        [leftButton addTarget:target action:event forControlEvents:UIControlEventTouchUpInside];
    }
    
    CGSize sizeNor = [self yh_getSizeConstrainedToSize:CGSizeMake(100, 40) byStr:title];
    CGSize sizeSel = [self yh_getSizeConstrainedToSize:CGSizeMake(100, 40) byStr:selectTitle];
    float width = MAX(sizeNor.width, AdaptedWidth(40));
    width = MAX(sizeSel.width, width);
    
    [leftButton setFrame:CGRectMake(0, 0.0f, width, 40.0f)];
    
    
    
    UIBarButtonItem * leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if(SystemVersion >= 11){
        spaceItem.width = -0;
        leftButton.contentEdgeInsets =UIEdgeInsetsMake(0, -AdaptedWidth(15),0, 0);
        leftButton.imageEdgeInsets =UIEdgeInsetsMake(0, -AdaptedWidth(15),0, 0);
    }else{
        spaceItem.width = -10;
    }
    
    [items addObject:spaceItem];
    [items addObject:leftBtnItem];
    self.navigationItem.leftBarButtonItems = items;
    
//    leftButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
//    leftButton.imageView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.8];
    
    if(barBtnBlock)
    {
        barBtnBlock(leftButton);
    }
}

-(void)yh_setRightNavigationItemBarWithImg:(NSString *)imgURL andSelectImg:(NSString *)imgSelect andTitle:(NSString *)title andSelectTitle:(NSString *)selectTitle andEvent:(SEL)event andTarget:(id)target andFinishBlock:(void (^)(UIButton *))barBtnBlock
{
    NSMutableArray * items = [[NSMutableArray alloc] initWithArray:self.navigationItem.rightBarButtonItems];
    self.navigationItem.rightBarButtonItems = @[];
    
    NSString *imgPath = imgURL;//?imgURL:@"navc_back";
    NSString *imgPathSelect = imgSelect;//?imgSelect:@"navc_back";
    
    UIImage * imageNormal = [UIImage imageNamed:imgPath];
    UIImage * imageSelect = [UIImage imageNamed:imgPathSelect];

    if(!imageNormal){
        imageNormal = QAloneImageByName(imgPath);
    }
    if(!imageSelect){
        imageSelect = QAloneImageByName(imgPathSelect);
    }
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.titleLabel.font = [UIFont yh_systemFont:14];
    [rightButton setImage:imageNormal forState:UIControlStateNormal];
    [rightButton setImage:imageSelect forState:UIControlStateSelected];
    
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitle:selectTitle forState:UIControlStateSelected];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    CGSize sizeNor = [self yh_getSizeConstrainedToSize:CGSizeMake(100, 40) byStr:title];
    CGSize sizeSel = [self yh_getSizeConstrainedToSize:CGSizeMake(100, 40) byStr:selectTitle];
    float width = MAX(sizeNor.width, AdaptedWidth(40));
    width = MAX(sizeSel.width, width);
    
    if(event)
    {
        [rightButton addTarget:target action:event forControlEvents:UIControlEventTouchUpInside];
    }
    
    [rightButton setFrame:CGRectMake(0, 0.0f, width, 40.0f)];
    
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    if(SystemVersion >= 11){
        spaceItem.width = -0;
        rightButton.contentEdgeInsets =UIEdgeInsetsMake(0, 0, 0, AdaptedWidth(-15));
        rightButton.imageEdgeInsets =UIEdgeInsetsMake(0, 0, 0, AdaptedWidth(-15));
    }else{
        spaceItem.width = -10;
    }
    
    [items addObject:spaceItem];
    [items addObject:rightBtnItem];
    
    self.navigationItem.rightBarButtonItems = items;
    
//    rightButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
//    rightButton.imageView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.8];
    
    if(barBtnBlock)
    {
        barBtnBlock(rightButton);
    }
}


- (CGSize)yh_getSizeConstrainedToSize:(CGSize)size byStr:(NSString *)str{
    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, 0)];
    tempLabel.text = str;
    tempLabel.numberOfLines = 0;
    tempLabel.font = [UIFont yh_systemFont:14];
    [tempLabel sizeToFit];
    
    CGSize fitSize = tempLabel.frame.size;
    fitSize = CGSizeMake(ceil(fitSize.width), ceil(fitSize.height));
    return fitSize;
}

@end
