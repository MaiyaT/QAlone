//
//  YHPicPickerItem.h
//  ZouYou
//
//  Created byRGCSDJ003 on 2019/3/7.
//  Copyright © 2019年RGCSDJDJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHPicPickerItem : NSObject


@property (retain, nonatomic) UIImage * pickImage;
@property (retain, nonatomic) NSData * pickData;

@property (copy, nonatomic) NSString * pickFilePath;

@property (assign, nonatomic) BOOL isGIF;
@property (assign, nonatomic) BOOL isVideo;
@property (retain, nonatomic) PHAsset * asset;

@property (copy, nonatomic) NSString * fileType;
//自动拼接的文件名 用户PhpID+时间戳（毫秒）+100000内随机数+文件类型
@property (copy, nonatomic) NSString * fileName;
//- (void)saveAssetToPath:(NSString *)savePath;

@property (copy, nonatomic) NSString * uploadURL;//上传之后的链接
@property (copy, nonatomic) NSString * desInfo;//描述信息

@end

NS_ASSUME_NONNULL_END
