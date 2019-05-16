//
//  UIViewController+PicPicker.m
//  BangBangXing
//
//  Created by 林宁宁 on 15/7/2.
//  Copyright (c) 2015年 蓝海(福建)信息技术有限公司. All rights reserved.
//

#import "UIViewController+PicPicker.h"
#import <objc/runtime.h>
#import <MobileCoreServices/MobileCoreServices.h>
//#import "UIImage+Color.h"
//#import "RGCSDJMacro.h"


@implementation UIViewController (PicPicker)


-(void)setPickerFinishBlick:(void (^)(NSArray<YHPicPickerItem *> *))PickerFinishBlick
{
    objc_setAssociatedObject(self, @selector(PickerFinishBlick), PickerFinishBlick, OBJC_ASSOCIATION_COPY);
}

-(void (^)(NSArray<YHPicPickerItem *> *))PickerFinishBlick
{
    return objc_getAssociatedObject(self, @selector(PickerFinishBlick));
}

- (void)ag_pickerSingleImageFromAlbumFinshBlock:(void (^)(NSArray<YHPicPickerItem *> *))finshBlock configPicker:(void (^)(TZImagePickerController *))configBlock{
    [self pickerImageFromAlbumWithFinshBlock:finshBlock configPicker:^(TZImagePickerController *picker) {
        picker.maxImagesCount = 1;
        picker.iconThemeColor = [UIColor blackColor];
        picker.naviBgColor = [UIColor blackColor];
        picker.barItemTextColor = [UIColor whiteColor];
        picker.naviTitleColor = [UIColor whiteColor];
        picker.navigationBar.tintColor = [UIColor whiteColor];
//        picker.allowCrop = YES;
        
        
        if(configBlock){
            configBlock(picker);
        }
    }];
}

/** 陪玩选取图片*/
- (void)yh_pickerImageFromAlbumFinishBlock:(void(^)(NSArray <YHPicPickerItem *> * pickerItems))finshBlock configPicker:(void(^)(TZImagePickerController * picker))configBlock
{
    [self pickerImageFromAlbumWithFinshBlock:finshBlock configPicker:^(TZImagePickerController *picker) {
        picker.maxImagesCount = 1;
        picker.iconThemeColor = [UIColor blackColor];
        picker.naviBgColor = [UIColor blackColor];
        picker.barItemTextColor = [UIColor whiteColor];
        picker.naviTitleColor = [UIColor whiteColor];
        picker.navigationBar.tintColor = [UIColor whiteColor];
        
        if(configBlock){
            configBlock(picker);
        }
    }];
}

-(void)pickerImageFromAlbumWithFinshBlock:(void (^)(NSArray<YHPicPickerItem *> *))finshBlock configPicker:(void (^)(TZImagePickerController *))configBlock
{
    
    self.PickerFinishBlick = finshBlock;
    
    //最大九张 每行三张
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    
    imagePickerVc.navigationBar.translucent = NO;
    imagePickerVc.barItemTextColor = [UIColor blackColor];

    imagePickerVc.isSelectOriginalPhoto = YES;
    
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    
    //    imagePickerVc.videoMaximumDuration = 60*10; // 视频最大拍摄时间
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
    }];
    
    imagePickerVc.iconThemeColor = [UIColor blackColor];
    imagePickerVc.naviBgColor = [UIColor blackColor];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    
    [imagePickerVc setPhotoPickerPageUIConfigBlock:^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
        [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    /*
     [imagePickerVc setAssetCellDidSetModelBlock:^(TZAssetCell *cell, UIImageView *imageView, UIImageView *selectImageView, UILabel *indexLabel, UIView *bottomView, UILabel *timeLength, UIImageView *videoImgView) {
     cell.contentView.clipsToBounds = YES;
     cell.contentView.layer.cornerRadius = cell.contentView.tz_width * 0.5;
     }];
     */
    
    // 3. Set allow picking video & photo & originalPhoto or not
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = YES;
    imagePickerVc.allowPickingMultipleVideo = YES;
    imagePickerVc.notScaleImage = YES;  //不缩放
    
    
    //    imagePickerVc.allowPickingMultipleVideo = YES; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = NO;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    //    imagePickerVc.allowCrop = self.allowCropSwitch.isOn;
    //    imagePickerVc.needCircleCrop = self.needCircleCropSwitch.isOn;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.frame.size.width - 2 * left;
    NSInteger top = (self.view.frame.size.height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
     [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
     [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
     [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
     }];
     imagePickerVc.delegate = self;
     */
    
    // Deprecated, Use statusBarStyle
    // imagePickerVc.isStatusBarDefault = NO;
    imagePickerVc.statusBarStyle = UIStatusBarStyleDefault;
    
    // 设置是否显示图片序号
    imagePickerVc.showSelectedIndex = NO;
    
    // 设置首选语言 / Set preferred language
    // imagePickerVc.preferredLanguage = @"zh-Hans";
    
    // 设置languageBundle以使用其它语言 / Set languageBundle to use other language
    // imagePickerVc.languageBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"tz-ru" ofType:@"lproj"]];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    //    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
    //
    //        NSLog(@"asd");
    //    }];
    //
    if(configBlock){
        configBlock(imagePickerVc);
    }
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    
    dispatch_queue_t queue = dispatch_queue_create("com.alone.suoshi.pic.picker", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    NSMutableArray * dataList = [[NSMutableArray alloc] init];
    
    for(NSInteger i = 0; i<photos.count; i++){
        
        dispatch_group_enter(group);
        
        YHPicPickerItem * pickerItem = [YHPicPickerItem new];
        UIImage * p_image = photos[i];
        PHAsset * p_asset = assets[i];
        
        NSString * fileType = [[p_asset valueForKey:@"filename"] componentsSeparatedByString:@"."].lastObject;
        pickerItem.fileType = [fileType lowercaseString];
        //判断是不是gif
        if([pickerItem.fileType containsString:@"gif"]){
            pickerItem.isGIF = YES;
        }
        
        
        pickerItem.pickImage = p_image;
        pickerItem.isVideo = (p_asset.mediaType == PHAssetMediaTypeVideo);
        pickerItem.asset = p_asset;
        
        if(pickerItem.isVideo){
            PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
            options.version = PHImageRequestOptionsVersionCurrent;
            options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
            [[PHImageManager defaultManager] requestAVAssetForVideo:p_asset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
                AVURLAsset *urlAsset = (AVURLAsset *)asset;
                NSURL *url = urlAsset.URL;
                pickerItem.pickFilePath = [url path];
                pickerItem.pickImage = [self rgcsdj_getFirstVideoWithURL:url];
                
                [dataList addObject:pickerItem];
                dispatch_group_leave(group);
            }];
        }else{
            PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
            options.resizeMode = PHImageRequestOptionsResizeModeFast;
            options.networkAccessAllowed = YES;
            [[PHImageManager defaultManager] requestImageDataForAsset:p_asset options:options resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                
                NSURL * url = info[@"PHImageFileURLKey"];
                pickerItem.pickFilePath = [url path];
//                NSData * data = [NSData dataWithContentsOfFile:pickerItem.pickFilePath];
                
                pickerItem.pickData = imageData;
                
                [dataList addObject:pickerItem];
                dispatch_group_leave(group);
            }];
        }
    }
    
    dispatch_group_notify(group, queue, ^{
        if(self.PickerFinishBlick){
            self.PickerFinishBlick(dataList);
        }
    });
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
//    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
//    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
//    [_collectionView reloadData];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(PHAsset *)asset {
//    _selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
//    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
//    // open this code to send video / 打开这段代码发送视频
//    [[TZImageManager manager] getVideoOutputPathWithAsset:asset presetName:AVAssetExportPreset640x480 success:^(NSString *outputPath) {
//        // Export completed, send video here, send by outputPath or NSData
//        // 导出完成，在这里写上传代码，通过路径或者通过NSData上传
//    } failure:^(NSString *errorMessage, NSError *error) {
//    }];
//    [_collectionView reloadData];
//    // _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
    
    YHPicPickerItem * pickerItem = [YHPicPickerItem new];
    pickerItem.pickImage = coverImage;
    pickerItem.isVideo = YES;
    pickerItem.asset = asset;
    
    WS(weakSelf);
    PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
    options.version = PHImageRequestOptionsVersionCurrent;
    options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
    [[PHImageManager defaultManager] requestAVAssetForVideo:asset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
        AVURLAsset *urlAsset = (AVURLAsset *)asset;
        NSURL *url = urlAsset.URL;
        
        pickerItem.pickFilePath = [url path];
        pickerItem.pickData = [NSData dataWithContentsOfURL:url];
        
        if(weakSelf.PickerFinishBlick){
            weakSelf.PickerFinishBlick(@[pickerItem]);
        }
    }];
}


//视频的缩略图
- (UIImage *)rgcsdj_getFirstVideoWithURL:(NSURL *)videoURL{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return thumb;
}


@end

