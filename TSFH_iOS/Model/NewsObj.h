//
//  NewsObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

typedef NS_ENUM(NSInteger, AnnouncementStyle) {
    AnnouncementStyleOther,
    AnnouncementStyleFirst,
};

@interface NewsObj : HTWObject

@property (readonly) NSArray *news;

@end

@interface NewObj : HTWObject

@property (readonly) NSString *title;
@property (readonly) NSString *link;
@property (readonly) NSString *newsDescription;
@property (readonly) NSString *pubDate;
@property (nonatomic) AnnouncementStyle style;

@end
