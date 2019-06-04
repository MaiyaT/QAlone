//
//  UIViewController+Banner.m
//  Storybook
//
//  Created by RY003 on 2019/5/22.
//  Copyright © 2019 YXGS. All rights reserved.
//

#import "UIViewController+Banner.h"


@implementation UIViewController (Banner)

-(UIView *)showBannerByID:(NSString *)bannerID{
    
    for(UIView * subV in self.view.subviews){
        if([subV isKindOfClass:[GADBannerView class]]){
            [subV removeFromSuperview];
        }
    }
    
    if(YHUserSetting.adClose){
        return nil;
    }
    
    GADBannerView * bannerView = [[GADBannerView alloc]
                   initWithAdSize:kGADAdSizeBanner];
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    bannerView.delegate = self;
    [self.view addSubview:bannerView];
    
    bannerView.adUnitID = bannerID;
    bannerView.rootViewController = self;
    bannerView.backgroundColor = [UIColor clearColor];

    GADRequest * request = [GADRequest request];
#if DEBUG
    request.testDevices = @[@"abf5a4987f4ca319081a8631fdcd3a37"];
#endif
    [bannerView loadRequest:request];
    
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(kGADAdSizeBanner.size.height);
    }];
    
    return bannerView;
}


/// Tells the delegate an ad request loaded an ad.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"adViewDidReceiveAd");
}

/// Tells the delegate an ad request failed.
- (void)adView:(GADBannerView *)adView
didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"adView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
- (void)adViewWillPresentScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillPresentScreen");
}

/// Tells the delegate that the full-screen view will be dismissed.
- (void)adViewWillDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewWillDismissScreen");
}

/// Tells the delegate that the full-screen view has been dismissed.
- (void)adViewDidDismissScreen:(GADBannerView *)adView {
    NSLog(@"adViewDidDismissScreen");
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView {
    NSLog(@"adViewWillLeaveApplication");
}



@end
