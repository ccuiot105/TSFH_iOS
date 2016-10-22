//
//  FeedManager.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedManager : NSObject

+ (id) shardInstance;

- (void) requestAnnouncementWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure;
- (void) requestSearchWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure;
- (void) requestClassficationWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure;

- (void) startReachablity;

@end
