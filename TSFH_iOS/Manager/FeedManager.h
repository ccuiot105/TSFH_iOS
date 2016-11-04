//
//  FeedManager.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckVersionObj.h"
#import "AutocomplateObj.h"
#import "NewsObj.h"
#import "CategoryObj.h"
#import "SearchObj.h"

@interface FeedManager : NSObject

+ (id) shardInstance;

- (void) requestCheckVersionWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(CheckVersionObj *obj)) success failure:(void(^)(NSString *msg)) failure;
- (void) requestAutocomplateWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType key:(NSString *) key success:(void(^)(NSArray<AutocomplateObj *> *obj)) success failure:(void(^)(NSString *msg)) failure;
- (void) requestNewsWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(NSArray<NewsObj *> *obj)) success failure:(void(^)(NSString *msg)) failure;
- (void) requestCategoryWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(NSArray<CategoryObj *> *obj)) success failure:(void(^)(NSString *msg)) failure;
- (void) requestSearchWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType cid:(NSString *) cid key:(NSString *) key success:(void(^)(NSArray<SearchObj *> *obj)) success failure:(void(^)(NSString *msg)) failure;

- (void) startReachablity;

@end
