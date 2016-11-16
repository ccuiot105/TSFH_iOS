//
//  ClassificationTableViewCell.m
//  TSFH_iOS
//
//  Created by Rex on 2016/11/15.
//  Copyright © 2016年 CCUIOT105. All rights reserved.
//

#import "ClassificationTableViewCell.h"
#import "UIImage+HTWImageView.h"
#import "UIView+Shadow.h"

@interface ClassificationTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ClassificationTableViewCell

- (void)initWithObject:(CategoryObj *)object
{
    self.title = object.title;
    self.subTitle = object.subtitle;
    self.backgroundImageUrl = object.imgURL;
}

-(void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

-(void)setSubTitle:(NSString *)subTitle
{
    self.subTitleLabel.text = subTitle;
}

-(void)setBackgroundImageUrl:(NSString *)backgroundImageUrl
{
    [self.backgroundImageView setImageWithURL:backgroundImageUrl];
}

-(void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
    [titleLabel shadow];
}

-(void)setSubTitleLabel:(UILabel *)subTitleLabel
{
    _subTitleLabel = subTitleLabel;
    [subTitleLabel shadow];
}

-(void)setBackgroundImageView:(UIImageView *)backgroundImageView
{
    _backgroundImageView = backgroundImageView;
    [backgroundImageView shadow];
}

@end
