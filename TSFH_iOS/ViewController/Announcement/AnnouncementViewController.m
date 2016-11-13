//
//  AnnouncementViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "AnnouncementViewController.h"
#import "FeedManager.h"
#import "AppManager.h"

@interface AnnouncementViewController ()
@property (nonatomic,strong) NewsObj *newsObj;
@end

@implementation AnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.newsObj) {
        [self loadAPI];
    }
}

#pragma mark - 設定相關
-(void)setNewsObj:(NewsObj *)newsObj
{
    _newsObj = newsObj;
    //資料載入，畫畫面
}

#pragma mark - 載入相關

-(void)loadAPI
{
    [FeedManager requestNewsSuccess:^(NewsObj * _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            self.newsObj = responseObject;
        }else{
            [AppManager showAlertWithMessage:@"與伺服器連線異常，是否重新連線" pressOK:^{
                [self loadAPI];
            } pressedCancel:^{
                
            }];
        }
    }];
}

@end
