//
//  ResultViewController.h
//  TSFH_iOS
//
//  Created by Rex on 2016/11/16.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "BaseViewController.h"
#import "CategoryObj.h"

@interface ResultViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

+(instancetype)ViewControllWithCategoryObj:(CategoryObj *)categoryObj;

+(instancetype)ViewControllWithKey:(NSString *)key;

@end
