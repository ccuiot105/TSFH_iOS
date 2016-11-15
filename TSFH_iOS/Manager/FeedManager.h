//
//  FeedManager.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 21/10/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseAPINetWorking.h"
#import "CheckVersionObj.h"
#import "AutocomplateObj.h"
#import "NewsObj.h"
#import "CategoryObj.h"
#import "SearchObj.h"

@interface FeedManager : NSObject

+ (void) requestCheckVersionSuccess:(ResponseBlock)success;

+ (void) requestNewsSuccess:(ResponseBlock)success;

+ (void) requestCategorysSuccess:(ResponseBlock)success;

+ (void) requestAutocomplatsWith:(NSString *) key success:(ResponseBlock)success;

+ (void) requestSearchsWithKey:(NSString *) key success:(ResponseBlock)success;

@end
