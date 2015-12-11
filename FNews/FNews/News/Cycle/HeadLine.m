//
//  HeadLine.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//http://c.m.163.com/nc/ad/headline/0-4.html

#import "HeadLine.h"
#import "NetWorkTool.h"

@implementation HeadLine

+ (instancetype)headLineWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    NSArray *properties = @[@"title",@"imgsrc"];
    
    for (NSString *key in properties) {
        if (dict[key]) {
            [obj setValue:dict[key] forKey:key];
        }
    }
//    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

+(void)headLinesWithCompletion:(void (^)(NSArray *))completion
{
    
    //断言
    NSAssert(completion != nil, @"没有传入 completion 参数");
    
    //加载数据
    [[NetWorkTool shareNetWorkTool] GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功%@",responseObject);
        
        //获取字典的数组
        NSArray *array = responseObject[@"headline_ad"];
        //字典转模型
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self headLineWithDict:dict]];
        }
        NSLog(@"%@",arrayM);
        
        completion(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}



@end
