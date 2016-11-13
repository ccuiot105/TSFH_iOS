//
//  BaseParamObject.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "BaseParamObject.h"
#import <UIKit/UIKit.h>

@interface BaseParamObject()

@end

@implementation BaseParamObject

- (NSString *)sysVer
{
    return [UIDevice currentDevice].systemVersion;;
}

- (NSString *)appVer
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];;
}

- (NSString *)devType
{
    return [UIDevice currentDevice].model;
}

- (NSString *)guid
{
    return [UIDevice currentDevice].identifierForVendor.UUIDString;;
}

@end
