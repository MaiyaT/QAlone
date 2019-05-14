//
//  UIViewController+PicPicker.h
//  BangBangXing
//
//  Created by 林宁宁 on 15/7/2.
//  Copyright (c) 2015年 蓝海(福建)信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import <Photos/Photos.h>

#import "YHPicPickerItem.h"

@interface UIViewController (PicPicker)<UINavigationControllerDelegate,TZImagePickerControllerDelegate>

@property (copy, nonatomic) void(^PickerFinishBlick)(NSArray <YHPicPickerItem *> * pickerItems);


- (void)pickerImageFromAlbumWithFinshBlock:(void(^)(NSArray <YHPicPickerItem *> * pickerItems))finshBlock configPicker:(void(^)(TZImagePickerController * picker))configBlock;


/** 左右选取图片*/
- (void)ag_pickerSingleImageFromAlbumFinshBlock:(void(^)(NSArray <YHPicPickerItem *> * pickerItems))finshBlock configPicker:(void(^)(TZImagePickerController * picker))configBlock;

/** 陪玩选取图片*/
- (void)yh_pickerImageFromAlbumFinishBlock:(void(^)(NSArray <YHPicPickerItem *> * pickerItems))finshBlock configPicker:(void(^)(TZImagePickerController * picker))configBlock;


@end

