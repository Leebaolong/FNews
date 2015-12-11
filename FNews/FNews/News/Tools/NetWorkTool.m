//
//  NetWorkTool.m
//  FNews
//
//  Created by apple on 15/12/11.
//  Copyright © 2015年 CoderLong. All rights reserved.
//

#import "NetWorkTool.h"


@implementation NetWorkTool

+(instancetype)shareNetWorkTool
{
    static NetWorkTool *tool;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        tool = [[self alloc] initWithBaseURL:url sessionConfiguration:config];
        
        
        //设置能够解析的 JSON 格式
        tool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return tool;
}

@end
