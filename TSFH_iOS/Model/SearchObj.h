//
//  SearchObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchObj : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, assign) NSInteger session;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, strong) NSString *group;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *medalURL;
@property (nonatomic, strong) NSString *school;
@property (nonatomic, strong) NSString *instructor;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *pdfURL;

@end
