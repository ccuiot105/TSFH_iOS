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
#import "AnnouncementTableViewCell.h"

#import <SafariServices/SafariServices.h>

@interface AnnouncementViewController ()<SFSafariViewControllerDelegate>
@property (nonatomic,strong) NewsObj *newsObj;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
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

-(void)dealloc
{
    
}

#pragma mark - 設定相關
-(void)setNewsObj:(NewsObj *)newsObj
{
    _newsObj = newsObj;
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
    [FeedManager requestNewsSuccess:^(NewsObj * _Nullable responseObject, NSError * _Nullable error) {
        self.loading = NO;
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsObj.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewObj *itemObj = self.newsObj.news[indexPath.row];
    itemObj.style = (indexPath.row == 0)?AnnouncementStyleFirst:AnnouncementStyleOther;
    AnnouncementTableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnnouncementTableViewCell class])];
    [cell initWithObject:itemObj];
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NewObj *itemObj = self.newsObj.news[indexPath.row];
    NSURL *url = [NSURL URLWithString:itemObj.link];
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
