//
//  ChannelCell.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsViewController.h"

@interface ChannelCell ()

@end

@implementation ChannelCell

//cell 将之前的NewsViewController的主视图添加到 cell 中
- (void)awakeFromNib
{
//    NSLog(@"%s",__FUNCTION__);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC = sb.instantiateInitialViewController;
    self.newsVC.view.frame = self.bounds;
    
    [self addSubview:self.newsVC.view];
}

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString.copy;
    
    self.newsVC.urlString = urlString;
}

@end
