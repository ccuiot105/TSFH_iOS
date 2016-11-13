//
//  ClassificationViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "ClassificationViewController.h"
#import "FeedManager.h"
#import "AppManager.h"

@interface ClassificationViewController ()
@property (nonatomic,strong) CategorysObj *categorysObj;
@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.categorysObj) {
        [self loadAPI];
    }
}

#pragma mark - 設定相關

-(void)setCategorysObj:(CategorysObj *)categorysObj
{
    _categorysObj = categorysObj;
    //資料載入，畫畫面
}

#pragma mark - 載入相關

-(void)loadAPI
{
    [FeedManager requestCategorysSuccess:^(CategorysObj * _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            self.categorysObj = responseObject;
        }else{
            [AppManager showAlertWithMessage:@"與伺服器連線異常，是否重新連線" pressOK:^{
                [self loadAPI];
            } pressedCancel:^{
                
            }];
        }
    }];
}

@end
