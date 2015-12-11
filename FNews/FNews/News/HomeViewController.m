//
//  HomeViewController.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"

@interface HomeViewController ()
@property (nonatomic,strong) NSArray *channels;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChannel];
//    NSLog(@"%@",self.channels);
}
- (void)setupChannel
{
    //取消间距
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //边距
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.channelView.bounds.size.height;
    
    //遍历
    for (Channel *channel in self.channels) {
        ChannelLabel *label = [ChannelLabel channelLabelWithTitle:channel.tname];
        label.frame = CGRectMake(x, 0, label.bounds.size.width, h);
        x += label.bounds.size.width;
        
        
        [self.channelView addSubview:label];
    }
    self.channelView.contentSize = CGSizeMake(x + margin, h); 
}


#pragma mark - 懒加载
//懒加载
- (NSArray *)channels
{
    if (_channels == nil) {
        _channels = [Channel channels];
    }
    return _channels;
}
@end
