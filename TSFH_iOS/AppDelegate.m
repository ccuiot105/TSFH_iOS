//
//  AppDelegate.m
//  TSFH_iOS
//
//  Created by Dareen Hsu on 19/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "AppDelegate.h"
#import "AppManager.h"
#import "FeedManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AppManager initAPP];

    [[FeedManager shardInstance] startReachablity];

    return YES;
}

@end
