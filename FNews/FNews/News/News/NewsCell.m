//
//  NewsCell.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
#import <UIImageView+AFNetworking.h>


@interface NewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraImages;


@end


@implementation NewsCell

- (void)setNews:(News *)news
{
    _news = news;
    self.titleView.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%zd",news.replyCount];
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
    
    if (news.imgextra.count == 2) {
        for (int i = 0; i < 2; ++i) {
            NSURL *url = [NSURL URLWithString:news.imgextra[i][@"imgsrc"]];
            UIImageView *imgView = self.extraImages[i];
            [imgView setImageWithURL:url];
        }

    }
    
}



- (void)awakeFromNib {
    //  摘要宽度
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 112;
}

+ (NSString *)cellIdentifier:(News *)news
{
    if (news.imgextra.count == 2) {
        return @"ImagesCell";
    }else if (news.imgType) {
        return @"BigImageCell";
    }
    return @"NewsCell";
}
+ (CGFloat)rowHeight:(News *)news
{
    if (news.imgextra.count == 2) {
        return 120;
    }else if (news.imgType) {
        return 180;
    }

    return 80;
}

@end
