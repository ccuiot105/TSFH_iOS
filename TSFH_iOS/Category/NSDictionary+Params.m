//
//  NSDictionary+Params.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "NSDictionary+Params.h"

@implementation NSDictionary(Params)

-(NSString *)params
{
    
    NSMutableString *paramsString = [NSMutableString stringWithString:@""];
    for (NSString *key in [self allKeys]) {
        NSString *value = [self objectForKey:key];
        [paramsString appendFormat:@"%@=%@&",key,value];
    }
    return paramsString;
}

@end
