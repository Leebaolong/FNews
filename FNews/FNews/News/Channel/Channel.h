//
//  Channel.h
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

@property (nonatomic,copy) NSString *tname;

@property (nonatomic,copy) NSString *tid;

@property (nonatomic,copy,readonly) NSString *urlString;

+ (instancetype)channelWithDict:(NSDictionary *)dict;

//频道数组
+ (NSArray *)channels;





@end
