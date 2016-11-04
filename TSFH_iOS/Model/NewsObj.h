//
//  NewsObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsObj : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *pubDate;

@end
