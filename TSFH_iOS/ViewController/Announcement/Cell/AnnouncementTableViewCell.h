//
//  AnnouncementTableViewCell.h
//  TSFH_iOS
//
//  Created by Rex on 2016/11/14.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "NewsObj.h"

@interface AnnouncementTableViewCell : BaseTableViewCell

@property (nonatomic) AnnouncementStyle style;

-(void)setPubDate:(NSString *)pubDate;
-(void)setTitle:(NSString *)title;
-(void)setNewsDescription:(NSString *)newsDescription;

@end
