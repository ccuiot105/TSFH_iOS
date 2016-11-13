//
//  AppManager.m
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "AppManager.h"
#import <UIKit/UIKit.h>
#import "UIColor+HexColor.h"

static AppManager *_manager = nil;

@implementation AppManager

+(id)shardInstance{
    @synchronized (_manager) {
        if (!_manager) {
            _manager = [AppManager new];

        }
    }
    return _manager;
}

+(void)initAPP
{
    [self changeNavigationBarStyle];
}

+(void)changeNavigationBarStyle
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = [UIColor colorForHex:@"48BFC1"];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
}

+(UIViewController*)getRootViewController
{
    id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = appDelegate.window;
    return window.rootViewController;
}

+(void) showAlertWithMessage:(NSString *) msg pressOK:(void(^)(void)) pok pressedCancel:(void(^)(void)) pcancel
{
    UIViewController *controller = [self getRootViewController];
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"提示"
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action) {
                             if (pok) pok();
                         }];
    
    [alert addAction:ok];
    
    if (!pcancel) {
        [controller presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 if (pcancel)
                                     pcancel();
                             }];
    
    
    [alert addAction:cancel];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

- (void) showAlertInViewController:(UIViewController *) controller message:(NSString *) msg {
    [self showAlertInViewController:controller message:msg pressOK:NULL pressedCancel:NULL];
}

- (void) showAlertInViewController:(UIViewController *) controller message:(NSString *) msg pressOK:(void(^)(void)) pok {
    [self showAlertInViewController:controller message:msg pressOK:pok pressedCancel:NULL];
}

- (void) showAlertInViewController:(UIViewController *) controller message:(NSString *) msg pressOK:(void(^)(void)) pok pressedCancel:(void(^)(void)) pcancel {
    UIAlertController * alert=   [UIAlertController
                                 alertControllerWithTitle:@"提示"
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action) {
                             [alert dismissViewControllerAnimated:YES completion:^{
                                 if (pok) pok();
                             }];
                         }];

    [alert addAction:ok];

    if (!pcancel) {
        [controller presentViewController:alert animated:YES completion:nil];
        return;
    }

    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 [alert dismissViewControllerAnimated:YES completion:^{
                                     if (pcancel)
                                         pcancel();
                                 }];
                             }];


    [alert addAction:cancel];

    [controller presentViewController:alert animated:YES completion:nil];
}

@end
