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
#import "ChannelCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) NSArray *channels;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionLayout;
//当前选中频道索引
@property (nonatomic,assign) NSInteger currentIndex;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChannel];
//    NSLog(@"%@",self.channels);
}

//视图将要显示子视图还么完成布局

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@ %@",NSStringFromCGRect(self.view.bounds),NSStringFromCGRect(self.collectionView.bounds));
}
//子视图布局完成 大小确定
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@ %@",NSStringFromCGRect(self.view.bounds),NSStringFromCGRect(self.collectionView.bounds));

    [self setupLayout];
}
- (void)setupLayout
{
    self.collectionLayout.itemSize = self.collectionView.bounds.size;
    self.collectionLayout.minimumLineSpacing = 0;
    self.collectionLayout.minimumInteritemSpacing = 0;
    self.collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChannelCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    NSLog(@"子视图控制器 %@",self.childViewControllers);
    
    if (![self.childViewControllers containsObject:(UIViewController *)cell.newsVC]) {
        [self addChildViewController:(UIViewController *)cell.newsVC];
    }
    
    
    Channel *channel = self.channels[indexPath.item];
    cell.urlString = channel.urlString;
    return cell;
}



#pragma mark - 滚动视图的代理方法
//只要滚动就执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%@",NSStringFromCGPoint(self.collectionView.contentOffset));
    ChannelLabel *currentLabel = self.channelView.subviews[self.currentIndex];
    ChannelLabel *nextLabel = nil;
    for (NSIndexPath *indexPath in self.collectionView.indexPathsForVisibleItems) {
        if (indexPath.item != self.currentIndex) {
            nextLabel = self.channelView.subviews[indexPath.item];
            break;
        }
    }
    NSLog(@"从 %@ 到 %@",currentLabel.text,nextLabel.text);
    if (nextLabel == nil) {
        return;
    }

    // 当前标签逐渐"变小" 变多小
        // 下一个标签逐渐"变大" 变多大
        // 下一个标签的比例
        CGFloat nextScale = ABS((float)scrollView.contentOffset.x / scrollView.bounds.size.width - self.currentIndex);
        CGFloat currentScale = 1 - nextScale;
        NSLog(@"%f --- %f", currentScale, nextScale);
        
        //设置标签比例
        currentLabel.scale = currentScale;
        nextLabel.scale = nextScale;
    
    
}

//停止滚动更新索引
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.currentIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    NSLog(@"停止 %@ %zd", NSStringFromCGPoint(scrollView.contentOffset), self.currentIndex);

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
    //默认选中第一条
    self.currentIndex = 0;
    //让第一个放大红色
    ChannelLabel *label = self.channelView.subviews[0];
    label.scale = 1.0;
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
