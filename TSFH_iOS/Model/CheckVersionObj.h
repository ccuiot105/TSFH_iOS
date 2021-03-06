//
//  CheckVersionObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

@interface CheckVersionObj : HTWObject

@property (nonatomic, strong) NSString *news;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *autocomplete;
@property (nonatomic, strong) NSString *search;

+ (instancetype)sharedInstance;

@end
