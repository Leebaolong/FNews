//
//  News.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
//标题
@property (nonatomic,copy) NSString *title;
//摘要
@property (nonatomic,copy) NSString *digest;
//图片
@property (nonatomic,copy) NSString *imgsrc;
//跟帖数
@property (nonatomic,assign) int replyCount;
//多张配图
@property (nonatomic,strong) NSArray *imgextra;
//大图标记
@property (nonatomic,assign) BOOL imgType;



+ (instancetype)newsWithDict:(NSDictionary *)dict;

//根据 URL 加载新闻数组
+ (void)newsWithURLString:(NSString *)urlString completion:(void (^)(NSArray *newsList))completion;


@end
