//
//  ChannelLabel.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelLabel : UILabel

+ (instancetype)channelLabelWithTitle:(NSString *)title;
/**
 *  显示的比例
 *  从 0~1，0的时候，字号14号，1的时候字号18
 */
@property (nonatomic, assign) CGFloat scale;

@end
