//
//  FeedManager.m
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "FeedManager.h"
#import "ReachabilityManager.h"
#import "AFNetworking.h"

#ifdef DEBUG
#define TSFH_DETACT_URL        @"http://www.google.com"
#define TSFH_URL               @"http://testurl"
#else
#define TSFH_DETACT_URL        @"http://www.google.com"
#define TSFH_URL               @"http://testurl"
#endif

#define TSFH_FEEDTIMEOUT  60

@interface FeedManager () <ReachabilityManagerDelegate> {
    BOOL _isConnect;
}

@property (nonatomic, strong) ReachabilityManager *reachablityManager;\

@property (copy) void(^CheckVersionSuccess)(CheckVersionObj *);
@property (copy) void(^CheckVersionFailure)(NSString *msg);

@property (copy) void(^AutocomplateSuccess)(NSArray<AutocomplateObj *> *);
@property (copy) void(^AutocomplateFailure)(NSString *msg);

@property (copy) void(^NewsSuccess)(NSArray<NewsObj *> *);
@property (copy) void(^NewsFailure)(NSString *msg);

@property (copy) void(^CategorySuccess)(NSArray<CategoryObj *> *);
@property (copy) void(^CategoryFailure)(NSString *msg);

@property (copy) void(^SearchSuccess)(NSArray<SearchObj *> *);
@property (copy) void(^SearchFailure)(NSString *msg);


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

- (void) requestCheckVersionWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(CheckVersionObj *obj)) success failure:(void(^)(NSString *msg)) failure {
    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_CheckVersionFailure)
            _CheckVersionFailure(@"請確認您的網路狀態");
    }

    _CheckVersionSuccess = success;
    _CheckVersionFailure = failure;

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/checkVersion",TSFH_URL]];
    NSString *bodyStrng = [NSString stringWithFormat:@"appVer=%@&sysVer=%@&guid=%@&devType=%@",appVer, sysVer, guid, devType];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TSFH_FEEDTIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",responseObject);

            NSDictionary *dict = (NSDictionary *)responseObject;

            CheckVersionObj *obj =  [CheckVersionObj new];

            //TODO

            if (_CheckVersionSuccess)
                _CheckVersionSuccess(obj);

        }else {
            if (_CheckVersionFailure)
                _CheckVersionFailure(@"資料發生錯誤!");
        }

    }];
    [dataTask resume];
}

- (void) requestAutocomplateWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType key:(NSString *) key success:(void(^)(NSArray<AutocomplateObj *> *obj)) success failure:(void(^)(NSString *msg)) failure {
    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_AutocomplateFailure)
            _AutocomplateFailure(@"請確認您的網路狀態");
    }

    _AutocomplateSuccess = success;
    _AutocomplateFailure = failure;

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/autocomplate",TSFH_URL]];
    NSString *bodyStrng = [NSString stringWithFormat:@"appVer=%@&sysVer=%@&guid=%@&devType=%@&key=%@",appVer, sysVer, guid, devType, key];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TSFH_FEEDTIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",responseObject);

            NSDictionary *dict = (NSDictionary *)responseObject;

            NSArray<AutocomplateObj *> *result = [NSArray new];

            //TODO

            if (_AutocomplateSuccess)
                _AutocomplateSuccess(result);

        }else {
            if (_AutocomplateFailure)
                _AutocomplateFailure(@"資料發生錯誤!");
        }
        
    }];
    [dataTask resume];
}

- (void) requestNewsWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(NSArray<NewsObj *> *obj)) success failure:(void(^)(NSString *msg)) failure {
    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_NewsFailure)
            _NewsFailure(@"請確認您的網路狀態");
    }

    _NewsSuccess = success;
    _NewsFailure = failure;

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/news",TSFH_URL]];
    NSString *bodyStrng = [NSString stringWithFormat:@"appVer=%@&sysVer=%@&guid=%@&devType=%@",appVer, sysVer, guid, devType];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TSFH_FEEDTIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",responseObject);

            NSDictionary *dict = (NSDictionary *)responseObject;

            NSArray<NewsObj *> *result = [NSArray new];

            //TODO

            if (_NewsSuccess)
                _NewsSuccess(result);

        }else {
            if (_NewsFailure)
                _NewsFailure(@"資料發生錯誤!");
        }
    }];
    [dataTask resume];
}

- (void) requestCategoryWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType success:(void(^)(NSArray<CategoryObj *> *obj)) success failure:(void(^)(NSString *msg)) failure {
    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_CategoryFailure)
            _CategoryFailure(@"請確認您的網路狀態");
    }

    _CategorySuccess = success;
    _CategoryFailure = failure;

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/category",TSFH_URL]];
    NSString *bodyStrng = [NSString stringWithFormat:@"appVer=%@&sysVer=%@&guid=%@&devType=%@",appVer, sysVer, guid, devType];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TSFH_FEEDTIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",responseObject);

            NSDictionary *dict = (NSDictionary *)responseObject;

            NSArray<CategoryObj *> *result = [NSArray new];

            //TODO

            if (_CategorySuccess)
                _CategorySuccess(result);

        }else {
            if (_CategoryFailure)
                _CategoryFailure(@"資料發生錯誤!");
        }
    }];
    [dataTask resume];
}

- (void) requestSearchWithAppVer:(NSString *) appVer sysVer:(NSString *) sysVer guid:(NSString *) guid devType:(NSString *) devType cid:(NSString *) cid key:(NSString *) key success:(void(^)(NSArray<SearchObj *> *obj)) success failure:(void(^)(NSString *msg)) failure {
    if ([self checkInternetIsOkAndShowAlert:YES]) {
        if (_SearchFailure)
            _SearchFailure(@"請確認您的網路狀態");
    }

    _SearchSuccess = success;
    _SearchFailure = failure;

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@/search",TSFH_URL]];
    NSString *bodyStrng = [NSString stringWithFormat:@"appVer=%@&sysVer=%@&guid=%@&devType=%@&cid=%@&key=%@",appVer, sysVer, guid, devType, cid, key];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setTimeoutInterval:TSFH_FEEDTIMEOUT];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[bodyStrng dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"%@",responseObject);

            NSDictionary *dict = (NSDictionary *)responseObject;

            NSArray<SearchObj *> *result = [NSArray new];

            //TODO

            if (_SearchSuccess)
                _SearchSuccess(result);

        }else {
            if (_SearchFailure)
                _SearchFailure(@"資料發生錯誤!");
        }
    }];
    [dataTask resume];
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
