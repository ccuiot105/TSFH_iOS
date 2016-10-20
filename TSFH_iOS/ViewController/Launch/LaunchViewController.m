//
//  LaunchViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //之後會在這抓checkversion資料，下面的NSTimer是模擬動作
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(transitionToMainVC) userInfo:nil repeats:NO];
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

@end
