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
#import "ClassificationTableViewCell.h"
#import "ResultViewController.h"

@interface ClassificationViewController ()
@property (nonatomic,strong) CategorysObj *categorysObj;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
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
    [self.tableView reloadData];
}

-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 300;
}

#pragma mark - 載入相關

-(void)loadAPI
{
    self.loading = YES;
    [FeedManager requestCategorysSuccess:^(CategorysObj * _Nullable responseObject, NSError * _Nullable error) {
        self.loading = NO;
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categorysObj.categorys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryObj *itemObj = self.categorysObj.categorys[indexPath.row];
    ClassificationTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ClassificationTableViewCell class])];
    [cell initWithObject:itemObj];
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CategoryObj *itemObj = self.categorysObj.categorys[indexPath.row];
    ResultViewController *vc = [ResultViewController ViewControllWithCategoryObj:itemObj];
    
    [self showViewController:vc sender:nil];
}


@end
