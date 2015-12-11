//
//  CycleViewController.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "CycleViewController.h"
#import "HeadLine.h"
#import "CycleCell.h"

@interface CycleViewController ()

@property (nonatomic,strong) NSArray *dataList;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
//当前显示的 index
@property (nonatomic,assign) NSInteger currentIndex;


@end

@implementation CycleViewController

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    
    [self.collectionView reloadData];
    self.currentIndex = 0;
    //默认显示第一页
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HeadLine headLinesWithCompletion:^(NSArray *headLines) {
        self.dataList = headLines;
    }];
    
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
}
//视图将要出现.视图本身的大小已经调整完毕
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.view.bounds));
    NSLog(@"===> %@",NSStringFromCGRect(self.view.bounds));
    self.layout.itemSize = self.collectionView.bounds.size;
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    

    
}
//视图将要布局子视图
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.view.bounds));
}
//完成子视图布局
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.view.bounds));
}
//视图完成出先
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.view.bounds));
}







#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CycleCell" forIndexPath:indexPath];
    
    NSInteger index = (indexPath.item + self.currentIndex - 1 + self.dataList.count) % self.dataList.count;
    NSLog(@"%zd  %tu",index,indexPath.item);
    
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    cell.headLine = self.dataList[index];
    
    return cell;
}
//滚动视图停止滚动方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int offset = scrollView.contentOffset.x / scrollView.bounds.size.width - 1;
    if (offset != 0) {
        //当前显示的页面
        self.currentIndex = (self.currentIndex + offset + self.dataList.count) % self.dataList.count;
        //滚动会第一页
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    
}

@end
