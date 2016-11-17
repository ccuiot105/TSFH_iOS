//
//  SearchViewController.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultViewController.h"
#import "AutocomplatsViewController.h"
#import "AutocomplateObj.H"
#import "FeedManager.h"
#import "AppManager.h"

@interface SearchViewController () <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UIView *resultBaseView;
@property (nonatomic, weak) IBOutlet UIView *autocomplatsView;
@property (nonatomic, weak) IBOutlet UISearchBar* searchBar;

@property (nonatomic, strong) AutocomplatsViewController *controller;
@property (nonatomic, strong) UITapGestureRecognizer *recognizer;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _autocomplatsView.hidden = YES;
    
    _recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizer:)];
    [_resultBaseView addGestureRecognizer:_recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tapRecognizer:(UITapGestureRecognizer *) recognizer {
    [self dismissAutocomplats:self];
}

- (void) dismissAutocomplats:(SearchViewController *) blockSelf {
    [UIView animateWithDuration:0.5 animations:^{
        blockSelf.controller.view.alpha = 0;
    } completion:^(BOOL finished) {
        [blockSelf.controller.view removeFromSuperview];
        [blockSelf.controller removeFromParentViewController];
        blockSelf.autocomplatsView.hidden = YES;
    }];
}

- (void) doSearch {
    ResultViewController *resultController = [ResultViewController ViewControllWithKey:_searchBar.text];
    [self.navigationController pushViewController:resultController animated:YES];
}

- (void) loadAPI {
    [FeedManager requestAutocomplatsWith:_searchBar.text success:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            _autocomplatsView.hidden = NO;
            
            __block SearchViewController* blockSelf = self;
            
            if (!_controller) {
                _controller = [self.storyboard instantiateViewControllerWithIdentifier:@"AutocomplatsViewController"];
            }
            
            [_autocomplatsView addSubview:_controller.view];
            _controller.view.frame = blockSelf.autocomplatsView.bounds;
            [self addChildViewController:blockSelf.controller];
            [self.controller didMoveToParentViewController:self];
            [self.controller reloadKeys:((AutocomplateObj *)responseObject).keys];
            [self.controller setSelectKey:^(NSString *key) {
                blockSelf.searchBar.text = key;

                [blockSelf dismissAutocomplats:blockSelf];
                [blockSelf doSearch];
            }];
            
        }else {
            [AppManager showAlertWithMessage:@"與伺服器連線異常，是否重新連線" pressOK:^{
                [self loadAPI];
            } pressedCancel:^{}];
        }
    }];
}

#pragma mark - UISearchBarDelegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self doSearch];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self loadAPI];
}

@end
