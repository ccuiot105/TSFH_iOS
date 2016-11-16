//
//  AppManager.h
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppManager : NSObject

+(id)shardInstance;

//初始設定
+(void)initAPP;

//改變NavigationBarStyle
+(void)changeNavigationBarStyle;

//取得RootViewController
+(UIViewController*)getRootViewController;

//秀alert
+(void) showAlertWithMessage:(NSString *) msg pressOK:(void(^)(void)) pok pressedCancel:(void(^)(void)) pcancel;

-(void)showAlertInViewController:(UIViewController *) controller message:(NSString *) msg;
-(void)showAlertInViewController:(UIViewController *) controller message:(NSString *) msg pressOK:(void(^)(void)) pok;
-(void)showAlertInViewController:(UIViewController *) controller message:(NSString *) msg pressOK:(void(^)(void)) pok pressedCancel:(void(^)(void)) pcancel;

@end
