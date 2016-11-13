//
//  CategoryObj.h
//  TSFH_iOS
//
//  Created by Dareen Hsu on 04/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

@interface CategorysObj : HTWObject

@property (readonly) NSArray *categorys;

@end

@interface CategoryObj : HTWObject

@property (nonatomic, assign) NSInteger sid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *imgURL;

@end
