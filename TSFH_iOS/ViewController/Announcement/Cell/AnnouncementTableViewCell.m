//
//  AnnouncementTableViewCell.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/14.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "AnnouncementTableViewCell.h"
#import "UIColor+HexColor.h"
#import "UIView+Shadow.h"

@interface AnnouncementTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *pubDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDescriptionLabel;

@end

@implementation AnnouncementTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (self.style == AnnouncementStyleOther) {
        self.cardView.backgroundColor = selected?[UIColor colorForHex:@"EDFFFF"]:[UIColor colorForHex:@"F2F0F2"];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (self.style == AnnouncementStyleOther) {
        self.cardView.backgroundColor = highlighted?[UIColor colorForHex:@"EDFFFF"]:[UIColor colorForHex:@"F2F0F2"];
    }else{
        self.cardView.backgroundColor = highlighted?[UIColor colorForHex:@"3AB3B5"]:[UIColor colorForHex:@"48BFC1"];
    }
}

- (void)initWithObject:(NewObj *)object
{
    self.style = object.style;
    self.pubDate = object.pubDate;
    self.title = object.title;
    self.newsDescription = object.newsDescription;
}
-(void)setStyle:(AnnouncementStyle)style
{
    _style = style;
    //
    UIColor *backgroundColor = [UIColor colorForHex:@"F2F0F2"];
    UIColor *pubDateColor = [UIColor colorForHex:@"F57C25"];
    UIColor *titleColor = [UIColor colorForHex:@"48BFC1"];
    UIColor *newsDescriptionColor = [UIColor blackColor];
    switch (style) {
        case AnnouncementStyleFirst:
        {
            backgroundColor = [UIColor colorForHex:@"48BFC1"];
            pubDateColor = [UIColor whiteColor];
            titleColor = [UIColor whiteColor];
            newsDescriptionColor = [UIColor whiteColor];
        }
            break;
        default:
            break;
    }
    self.cardView.backgroundColor = backgroundColor;
    self.pubDateLabel.textColor = pubDateColor;
    self.titleLabel.textColor = titleColor;
    self.newsDescriptionLabel.textColor = newsDescriptionColor;
}

-(void)setPubDate:(NSString *)pubDate
{
    self.pubDateLabel.text = pubDate;
}

-(void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

-(void)setNewsDescription:(NSString *)newsDescription
{
    self.newsDescriptionLabel.text = newsDescription;
}

-(void)setCardView:(UIView *)cardView
{
    _cardView = cardView;
    [cardView shadow];
}
@end
