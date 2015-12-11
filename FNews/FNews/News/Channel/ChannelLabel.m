//
//  ChannelLabel.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "ChannelLabel.h"

#define NormalSize      14.0
#define SelectedSize    18.0

@implementation ChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title
{
    ChannelLabel *chaLabel = [[self alloc] init];
    chaLabel.text = title;
    
    chaLabel.font = [UIFont systemFontOfSize:SelectedSize];
    chaLabel.textAlignment = NSTextAlignmentCenter;
    
    [chaLabel sizeToFit];
    
    chaLabel.font = [UIFont systemFontOfSize:NormalSize];
    
    
    return chaLabel;
    
}

- (void)setScale:(CGFloat)scale
{
    CGFloat max = SelectedSize / NormalSize - 1;
    
    CGFloat percent = max * scale + 1;
    
    self.transform = CGAffineTransformMakeScale(percent, percent);
    
    //变色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];
}




@end
