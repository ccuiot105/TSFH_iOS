//
//  ResultViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/16.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "ResultViewController.h"
#import "FeedManager.h"
#import "AppManager.h"
#import "ResultTableViewCell.h"
#import <SafariServices/SafariServices.h>

@interface ResultViewController ()<SFSafariViewControllerDelegate>
@property(nonatomic,weak) CategoryObj *categoryObj;
@property(nonatomic,strong) NSString *key;
@property(nonatomic,strong) SearchObjs *searchObjs;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ResultViewController

+(instancetype)ViewControllWithCategoryObj:(CategoryObj *)categoryObj
{
    ResultViewController *vc = [self ViewControll];
    vc.categoryObj = categoryObj;
    return vc;
}

+(instancetype)ViewControllWithKey:(NSString *)key
{
    ResultViewController *vc = [self ViewControll];
    vc.key = key;
    return vc;
}

+(instancetype)ViewControll
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ResultViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 取得相關

-(NSString *)sid{
    if (!self.categoryObj) {
        return nil;
    }
    return [NSString stringWithFormat:@"%ld",(long)self.categoryObj.sid];
}

#pragma mark - 設定相關

-(void)setCategoryObj:(CategoryObj *)categoryObj
{
    _categoryObj = categoryObj;
    self.title = categoryObj.title;
    [self loadAPI];
}

-(void)setSearchObjs:(SearchObjs *)searchObjs
{
    _searchObjs = searchObjs;
    if (self.tableView.window) {
        [self.tableView reloadData];
    }
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
    [FeedManager requestSearchsWithKey:self.key sid:self.sid success:^(SearchObjs *_Nullable responseObject, NSError * _Nullable error) {
        self.loading = NO;
        if (!error) {
            self.searchObjs = responseObject;
        }else{
            [AppManager showAlertWithMessage:@"與伺服器連線異常，是否重新連線" pressOK:^{
                [self loadAPI];
            } pressedCancel:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchObjs.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchObj *itemObj = self.searchObjs.items[indexPath.row];
    ResultTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ResultTableViewCell class])];
    [cell initWithObject:itemObj];
    cell.tableView = tableView;
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchObj *itemObj = self.searchObjs.items[indexPath.row];
    NSURL *url = [NSURL URLWithString:itemObj.pdfURL];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:YES completion:nil];
}

#pragma mark - SFSafariViewControllerDelegate

- (NSArray<UIActivity *> *)safariViewController:(SFSafariViewController *)controller activityItemsForURL:(NSURL *)URL title:(nullable NSString *)title
{
    return nil;
}

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully
{
    
}

@end
