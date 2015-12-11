//
//  NewsCell.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell

@property (nonatomic,strong) News *news;

/**
 *  根据模型确定可重用标识符
 */
+ (NSString *)cellIdentifier:(News *)news;
/**
 *  根据模型计算行高
 */
+ (CGFloat)rowHeight:(News *)news;



@end
