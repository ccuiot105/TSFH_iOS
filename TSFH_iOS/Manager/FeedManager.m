//
//  FeedManager.m
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "FeedManager.h"
#import "ResponseAPINetWorking.h"
#import "DataKeyParamObject.h"

#define TSFH_SERVER             @"http://callnumber.acsite.org/"
#define TSFH_CHECK_VERSION_URL  [NSString stringWithFormat:@"%@/TSFH/checkversion.php",TSFH_SERVER]

@interface FeedManager ()

@end

@implementation FeedManager

+ (void) requestCheckVersionSuccess:(ResponseBlock)success{
    [ResponseAPINetWorking requestUrl:TSFH_CHECK_VERSION_URL param:[BaseParamObject new] block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (success) {
            success([CheckVersionObj objectFromDictionary:responseObject],error);
        }
    }];
}

+ (void) requestNewsSuccess:(ResponseBlock)success{
    [ResponseAPINetWorking requestUrl:[CheckVersionObj sharedInstance].news param:[BaseParamObject new] block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (success) {
            success([NewsObj objectFromDictionary:responseObject],error);
        }
    }];
}

+ (void) requestCategorysSuccess:(ResponseBlock)success{
    [ResponseAPINetWorking requestUrl:[CheckVersionObj sharedInstance].category param:[BaseParamObject new] block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (success) {
            success([CategorysObj objectFromDictionary:responseObject],error);
        }
    }];
}

+ (void) requestAutocomplatsWith:(NSString *) key success:(ResponseBlock)success{
    DataKeyParamObject *paramObj = [DataKeyParamObject new];
    paramObj.key = key;
    
    [ResponseAPINetWorking requestUrl:[CheckVersionObj sharedInstance].autocomplate param:paramObj block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (success) {
            success([AutocomplateObj objectFromDictionary:responseObject],error);
        }
    }];
}

+ (void) requestSearchsWithKey:(NSString *)key sid:(NSString *)sid success:(ResponseBlock)success{
    DataKeyParamObject *paramObj = [DataKeyParamObject new];
    paramObj.key = key;
    paramObj.sid = sid;
    
    [ResponseAPINetWorking requestUrl:[CheckVersionObj sharedInstance].search param:[DataKeyParamObject new] block:^(NSDictionary * _Nullable responseObject, NSError * _Nullable error) {
        if (success) {
            success([SearchObjs objectFromDictionary:responseObject],error);
        }
    }];
}

@end
