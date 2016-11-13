//
//  BaseParamObject.h
//  TSFH_iOS
//
//  Created by Rex on 2016/11/13.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "HTWObject.h"

@interface BaseParamObject : HTWObject

//APP版本
@property (readonly) NSString *appVer;
//系統版本
@property (readonly) NSString *sysVer;
//裝置唯一碼
@property (readonly) NSString *guid;
//裝置類別
@property (readonly) NSString *devType;

@end
