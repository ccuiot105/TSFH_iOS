//
//  RHImageView.h
//  NSUrlSessionExmaple
//
//  Created by Rex on 2015/9/24.
//  Copyright (c) 2015年 Rex. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - UIImageView(HTWImageView) Category

typedef void(^HTWImageCompletionWithFinishedBlock)(UIImage *image);
//為UIImageView作擴充(extention)
@interface UIImageView(HTWImageView)
//
-(NSString *)urlString;

- (void)setImageWithURL:(NSString *)urlString;

- (void)setImageWithURL:(NSString *)urlString animation:(BOOL)animation;

- (void)setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholder animation:(BOOL)animation;

- (void)setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholder animation:(BOOL)animation completed:(HTWImageCompletionWithFinishedBlock)completedBlock;

@end