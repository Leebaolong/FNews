//
//  NewsViewController.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsViewController ()
@property (nonatomic,strong) NSArray *newsList;
@end

@implementation NewsViewController

- (void)setNewsList:(NSArray *)newsList
{
    _newsList = newsList;
    [self.tableView reloadData];
}

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
 
    //article/headline/T1348647853363/0-20.html
    [News newsWithURLString:urlString completion:^(NSArray *newsList) {
        self.newsList = newsList;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News *news = self.newsList[indexPath.row];
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell cellIdentifier:news] forIndexPath:indexPath];
    

    cell.news = self.newsList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *news = self.newsList[indexPath.row];

    return [NewsCell rowHeight:news];
}


@end
