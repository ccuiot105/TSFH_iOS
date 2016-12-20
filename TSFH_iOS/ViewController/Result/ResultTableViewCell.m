//
//  ResultTableViewCell.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/16.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "ResultTableViewCell.h"
#import "UIImage+HTWImageView.h"
#import "UIView+Shadow.h"
#import "UIColor+HexColor.h"

@interface ResultTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *medalImageView;
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructorLabel;

//layout
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *instructorTopHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *schoolTopHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWidth;


@property(nonatomic,weak) SearchObj *searchObj;
@end

@implementation ResultTableViewCell

-(void)awakeFromNib
{
    [super awakeFromNib];
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //seconds
    lpgr.delegate = self;
    [self addGestureRecognizer:lpgr];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.searchObj.isShowAll = !self.searchObj.isShowAll;
        [self reloadDate];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.cardView.backgroundColor = highlighted?[UIColor colorForHex:@"EDFFFF"]:[UIColor colorForHex:@"F2F0F2"];
}

- (void)initWithObject:(SearchObj *)object
{
    self.searchObj = object;
    [self reloadDate];
}

-(void)reloadDate
{
    SearchObj *object = self.searchObj;
    self.title = object.title;
    self.subTitle = [NSString stringWithFormat:@"%@/%@/%@",object.author,object.group,object.subject];
    self.summary = object.summary;
    self.medalImageUrl = object.medalURL;
    if (object.medalURL.length > 0) {
        self.iconWidth.constant = 40;
    }else{
        self.iconWidth.constant = 0;
    }
    
    if (self.searchObj.isShowAll) {
        self.school = object.school;
        self.instructor = object.instructor;
    }else{
        self.school = nil;
        self.instructor = nil;
    }
    
    [self checkStyle];
}

-(void)checkStyle
{
    if (self.searchObj.isShowAll) {
        self.titleLabel.numberOfLines = 0;
        self.subTitleLabel.numberOfLines = 0;
        self.summaryLabel.numberOfLines = 0;
        
        self.schoolTopHeight.constant = 4;
        self.instructorTopHeight.constant = 4;
    }else{
        self.titleLabel.numberOfLines = 1;
        self.subTitleLabel.numberOfLines = 1;
        self.summaryLabel.numberOfLines = 2;
        
        self.schoolTopHeight.constant = 0;
        self.instructorTopHeight.constant = 0;
    }
}

-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

-(void)setSubTitle:(NSString *)subTitle
{
    self.subTitleLabel.text = subTitle;
}

-(void)setSummary:(NSString *)summary
{
    self.summaryLabel.text = summary;
}

-(void)setMedalImageUrl:(NSString *)medalImageUrl
{
    [self.medalImageView setImageWithURL:medalImageUrl];
}

-(void)setCardView:(UIView *)cardView
{
    _cardView = cardView;
    [cardView shadow];
}

-(void)setSchool:(NSString *)school
{
    self.schoolLabel.text = school?[NSString stringWithFormat:@"學校:%@",school]:nil;
}

-(void)setInstructor:(NSString *)instructor
{
    self.instructorLabel.text = instructor?[NSString stringWithFormat:@"指導老師:%@",instructor]:nil;
}

@end
