//
//  FeedManager.m
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "FeedManager.h"
#import "ReachabilityManager.h"

#ifdef DEBUG
#define TSFH_DETACT_URL        @"http://www.google.com"
#else
#define TSFH_DETACT_URL        @"http://www.google.com"
#endif


@interface FeedManager () <ReachabilityManagerDelegate> {
    BOOL _isConnect;
}

@property (nonatomic, strong) ReachabilityManager *reachablityManager;\

@property (copy) void(^AnnouncementSuccess)(void);
@property (copy) void(^AnnouncementFailure)(void);

@property (copy) void(^SearchSuccess)(void);
@property (copy) void(^SearchFailure)(void);

@property (copy) void(^ClassficationSuccess)(void);
@property (copy) void(^ClassficationFailure)(void);


@end

static FeedManager *_manager = nil;

@implementation FeedManager

+ (id) shardInstance {
    @synchronized (_manager) {
        if (!_manager) {
            _manager = [FeedManager new];

        }
    }
    return _manager;

}

- (void) requestAnnouncementWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure {
    _AnnouncementSuccess = success;
    _AnnouncementFailure = failure;

    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_AnnouncementFailure)
            _AnnouncementFailure();

        return;
    }

}

- (void) requestSearchWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure {
    _SearchSuccess = success;
    _SearchFailure = failure;

    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_SearchFailure)
            _SearchFailure();

        return;
    }

}

- (void) requestClassficationWithSuccess:(void(^)(void)) success failure:(void(^)(void)) failure {
    _ClassficationFailure = success;
    _ClassficationFailure = failure;

    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_ClassficationFailure)
            _ClassficationFailure();

        return;
    }


}

#pragma mark - ReachablityManager Methods
- (void) startReachablity {
    if (!_reachablityManager) {
        _reachablityManager = [[ReachabilityManager alloc] initWithHostName:TSFH_DETACT_URL];
        _reachablityManager.delegate = self;
    }

    [_reachablityManager startManager];
}

- (BOOL) checkInternetIsOkAndShowAlert:(BOOL) show {
    if (!_isConnect && show) {
        // TODO: show alert message

    }
    return _isConnect;
}


#pragma mark - ReachabilityManagerDelegate Methods
- (void) reachabilityChangeWithInternet:(BOOL) isConnect {
    _isConnect = isConnect;
}

@end
