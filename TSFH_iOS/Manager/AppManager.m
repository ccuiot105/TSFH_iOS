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

@implementation AppManager

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

@end
