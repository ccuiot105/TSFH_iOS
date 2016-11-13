//
//  NetWorking.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "NetWorking.h"

@implementation NetWorking

+ (NSTimeInterval)timeoutInterval
{
    return 10;
}

+ ( NSURLSessionDataTask * _Nonnull )requestUrl:(NSString * _Nonnull)urlString param:(BaseParamObject * _Nonnull)params block:(ResponseBlock _Nullable)block
{
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSString *bodyStrng = [[params convertToDictionary] params] ;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:[self timeoutInterval]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"\n========================\nRequest to %@ \n\nParameter : \n%@\n%@\n\n========================", url, bodyStrng,responseObject);
        if (block) {
            block(responseObject,error);
        }
    }];
    [dataTask resume];
    return dataTask;
}

@end
