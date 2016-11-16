//
//  DataKeyParamObject.h
//  TSFH_iOS
//
//  Created by Darren Hsu on 15/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "BaseParamObject.h"

@interface DataKeyParamObject : BaseParamObject

/* 搜尋的key值 */
@property (nonatomic, strong) NSString *key;
/* 學科id */
@property (nonatomic, strong) NSString *sid;

@end
