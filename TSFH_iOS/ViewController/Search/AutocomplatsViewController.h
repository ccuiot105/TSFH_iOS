//
//  AutocomplatsViewController.h
//  TSFH_iOS
//
//  Created by Darren Hsu on 17/11/2016.
//  Copyright © 2016 CCUIOT105. All rights reserved.
//

#import "BaseViewController.h"
#import "AutocomplateObj.h"

@interface AutocomplatsViewController : BaseViewController

@property (copy) void (^SelectKey)(NSString *);

- (void) reloadKeys:(NSArray *) keys;

@end
