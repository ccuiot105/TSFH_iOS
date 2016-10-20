//
//  UIColor+HexColor.h
//  TSFH_iOS
//
//  Created by Rex on 2016/10/20.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(HexColor)

//使用hex格式的color
+ (UIColor *)colorForHex:(NSString *)hexColor;

@end
