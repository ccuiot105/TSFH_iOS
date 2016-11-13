//
//  CheckVersionObj.m
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "CheckVersionObj.h"

@implementation CheckVersionObj

+ (instancetype)sharedInstance{
    static CheckVersionObj *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

+ (instancetype)objectFromDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) return nil;
    
    CheckVersionObj *instance = [self sharedInstance];
    
    if (instance) {
        [instance setValuesForKeysWithDictionary:dictionary];
    }
    
    return instance;
}

@end
