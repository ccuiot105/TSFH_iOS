//
//  ResponseObject.h
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

@interface ResponseObject : HTWObject

@property (readonly) NSInteger stateCode;
@property (readonly) NSString *stateMessage;
@property (readonly) id stateObject;

@end
