//
//  BaseViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic,strong) UIActivityIndicatorView *activityView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    self.activityView.center = self.view.center;
    [self.view addSubview:self.activityView];
    self.loading = NO;
}

-(void)setLoading:(BOOL)loading
{
    _loading = loading;
    self.activityView.hidden = loading;
    if (loading) {
        [self.activityView startAnimating];
    }else{
        [self.activityView stopAnimating];
    }
}

@end
