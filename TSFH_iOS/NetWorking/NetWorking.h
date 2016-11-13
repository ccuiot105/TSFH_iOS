//
//  NetWorking.h
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseParamObject.h"
#import "NSDictionary+Params.h"
#import "AFNetworking.h"

typedef void (^ResponseBlock)(id _Nullable responseObject, NSError * _Nullable error);

@interface NetWorking : NSObject

+ (NSTimeInterval)timeoutInterval;

+ ( NSURLSessionDataTask * _Nonnull )requestUrl:(NSString * _Nonnull)urlString param:(BaseParamObject * _Nonnull)params block:(ResponseBlock _Nullable)block;

@end
