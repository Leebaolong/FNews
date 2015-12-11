//
//  Channel.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "Channel.h"

@implementation Channel

+ (NSArray *)channels
{
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSArray *array = dict[@"tList"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id  obj, NSUInteger idx, BOOL *stop) {
        [arrayM addObject:[self channelWithDict:obj]];
    }];
    
    // 需要排序 － 按照 tid 进行排序！
    return [arrayM sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    
//    return arrayM.copy;
}


+ (instancetype)channelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    NSArray *array = [self properties];
    [array enumerateObjectsUsingBlock:^(NSString  *key, NSUInteger idx, BOOL *stop) {
        if (dict[key]) {
            [obj setValue:dict[key] forKey:key];
        }
    }];
    return obj;
    
}

- (void)setTid:(NSString *)tid
{
    _tid = tid.copy;
    _urlString = [NSString stringWithFormat:@"%@/0-20.html",tid];
}

+ (NSArray *)properties
{
    return @[@"tname",@"tid"];
}

- (NSString *)description
{
    NSDictionary *dict = [self dictionaryWithValuesForKeys:[Channel properties]];
    return [NSString stringWithFormat:@"<%@: %p> %@",self.class,self,dict];
}






@end
