//
//  News.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html

#import "News.h"
#import <objc/runtime.h>
#import "NetWorkTool.h"

@implementation News


+ (void)newsWithURLString:(NSString *)urlString completion:(void (^)(NSArray *))completion
{
    //断言
    NSAssert(completion != nil, @"必须传入回调参数");
    
    
    [[NetWorkTool shareNetWorkTool] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task,NSDictionary *responseObject) {
        NSLog(@"成功==>%@",responseObject);
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self newsWithDict:dict]];
            
        }
        completion(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败???>%@",error);
    }];
}

+(instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    NSArray *properties = [self loadProperties];
    
    for (NSString *key in properties) {
        if (dict[key]) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
//    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}


+ (NSArray *)loadProperties
{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSLog(@"====......>%d",count);
#warning todo
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i) {
        //1.获取属性
        objc_property_t pty = properties[i];
        const char *cname = property_getName(pty);
        NSLog(@"%s",cname);
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    NSLog(@"属性数组%@",arrayM);

    //释放属性数组
    free(properties);
    
    return arrayM;
}





@end
