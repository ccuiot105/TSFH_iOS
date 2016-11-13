//
//  ResponseAPINetWorking.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "ResponseAPINetWorking.h"

NSString* const ResponseAPIErrorDomain = @"ResponseAPIErrorDomain";

@implementation ResponseAPINetWorking

+ ( NSURLSessionDataTask * _Nonnull )requestUrl:(NSString * _Nonnull)urlString param:(BaseParamObject * _Nonnull)params block:(ResponseBlock _Nullable)block
{
    return [super requestUrl:urlString param:params block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (block) {
            if (!error) {
                ResponseObject *response = [ResponseObject objectFromDictionary:responseObject];
                if (response.stateCode < 0) {
                    error = [NSError errorWithDomain:ResponseAPIErrorDomain code:response.stateCode userInfo:[response convertToDictionary]];
                }
                
                block(response.stateObject,error);
            }else {
                block(nil,error);
            }
        }
    }];
}

@end
