//
//  LaunchViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "LaunchViewController.h"
#import "FeedManager.h"
#import "AppManager.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAPI];
}

-(void)transitionToMainVC
{
    __weak UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    __weak UIViewController *vc = [self p_buildRootController];
    [UIView transitionFromView:self.view
                        toView:vc.view
                      duration:0.25f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished){
                        window.rootViewController = vc;
                    }];
}

- (UIViewController *)p_buildRootController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc =[storyboard instantiateInitialViewController];
    return vc;
}

#pragma mark - 載入相關

-(void)loadAPI
{
    [FeedManager requestCheckVersionSuccess:^(CheckVersionObj * _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            [self transitionToMainVC];
        }else{
            [AppManager showAlertWithMessage:@"與伺服器連線異常，是否重新連線" pressOK:^{
                [self loadAPI];
            } pressedCancel:nil];
        }
    }];
}

@end
