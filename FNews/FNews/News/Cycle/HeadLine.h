//
//  HeadLine.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
/*
 "headline_ad": [
 {
 "title": "屠呦呦领取诺奖 获奖金300万元",
 "tag": "photoset",
 "subtitle": "",
 "imgsrc": "http://img1.cache.netease.com/3g/2015/12/11/201512110102165f59b.jpg",
 "url": "54GI0096|84233"
 },
 */

#import <Foundation/Foundation.h>

@interface HeadLine : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgsrc;


+ (instancetype)headLineWithDict:(NSDictionary *)dict;

/**
 *  返回数据数组
 */
+ (void)headLinesWithCompletion:(void (^)(NSArray *headLines))completion;


@end
