//
//  RHImageView.m
//  NSUrlSessionExmaple
//
//  Created by Rex on 2015/9/24.
//  Copyright (c) 2015年 Rex. All rights reserved.
//

#import <objc/runtime.h>
#import "UIImage+HTWImageView.h"

#pragma mark - UIImageView(HTWImageView) Category

@implementation UIImageView(HTWImageView)

static const char *URLSTRING_PROPERTY_KEY = "URLSTRING_PROPERTY_KEY";

-(void)setUrlString:(NSString *)urlString
{
    objc_setAssociatedObject(self, URLSTRING_PROPERTY_KEY, urlString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)urlString
{
    return objc_getAssociatedObject(self, URLSTRING_PROPERTY_KEY);
}

- (void)setImageWithURL:(NSString *)urlString
{
    [self setImageWithURL:urlString animation:NO];
}

- (void)setImageWithURL:(NSString *)urlString animation:(BOOL)animation
{
    [self setImageWithURL:urlString placeholderImage:nil animation:animation completed:nil];
}

- (void)setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholder animation:(BOOL)animation
{
    [self setImageWithURL:urlString placeholderImage:placeholder animation:animation completed:nil];
}

- (void)setImageWithURL:(NSString *)urlString placeholderImage:(UIImage *)placeholder animation:(BOOL)animation completed:(HTWImageCompletionWithFinishedBlock)completedBlock
{
    if ([self.urlString isEqualToString:urlString]) {
        return;
    }
    self.urlString = urlString;
    self.image = placeholder;
    
    if (!urlString) {
        self.image = nil;
        return;
    }
    
    NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:location]];
        if ([urlString isEqualToString:self.urlString]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView transitionWithView:self
                                  duration:(animation)?.5f:0
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    self.image = image;
                                } completion:^(BOOL finished) {
                                    if (completedBlock) {
                                        completedBlock(image);
                                    }
                                }];
            });
            
        }
    }];
    [task resume];
}

@end
