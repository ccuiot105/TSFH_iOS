//
//  SearchObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

@interface SearchObjs : HTWObject

@property (readonly) NSArray *items;

@end

@interface SearchObj : HTWObject

@property (readonly) NSString *title;
@property (readonly) NSString *category;
@property (readonly) NSInteger session;
@property (readonly) NSInteger year;
@property (readonly) NSString *group;
@property (readonly) NSString *subject;
@property (readonly) NSString *medalURL;
@property (readonly) NSString *school;
@property (readonly) NSString *instructor;
@property (readonly) NSString *author;
@property (readonly) NSString *summary;
@property (readonly) NSString *country;
@property (readonly) NSString *pdfURL;

@property (nonatomic) BOOL isShowAll;

@end
