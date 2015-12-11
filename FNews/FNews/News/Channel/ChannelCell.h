//
//  ChannelCell.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsViewController;
@interface ChannelCell : UICollectionViewCell
//新闻视图控制器
@property (nonatomic,strong) NewsViewController *newsVC;

//频道 URL 字符串
@property (nonatomic,copy) NSString *urlString;

@end
