//
//  CycleCell.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "CycleCell.h"
#import "HeadLine.h"
#import <UIImageView+AFNetworking.h>;

@interface CycleCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end


@implementation CycleCell


- (void)setHeadLine:(HeadLine *)headLine
{
    _headLine = headLine;
    
    [self.iconView setImageWithURL:[NSURL URLWithString:headLine.imgsrc]];
}

@end
