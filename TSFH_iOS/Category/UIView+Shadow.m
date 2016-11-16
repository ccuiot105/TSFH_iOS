//
//  UIView+Shadow.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/16.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView(Shadow)

-(void)shadow
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(3,2);
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowRadius = 1.0;
    self.clipsToBounds = NO;
}

@end
