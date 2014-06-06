//
//  Request.m
//  IUTourism
//
//  Created by mac on 14-5-29.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "Request.h"
#import "AFHTTPRequestOperation.h"
#import "IUMode.h"

@implementation Request

+ (void)requestJSONWithUrl:(NSURL *)url
{
    //接受数据的数组
    NSMutableArray * dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation,id JSON){
        NSString * resultString = operation.responseString;
//        NSLog(@"requestSuccess:%@",resultString);
        NSData * resultData = [[NSData alloc]initWithData:[resultString dataUsingEncoding:NSUTF8StringEncoding]];
        //Json解析
        NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"resultDic:%@",resultDic);
        if (resultDic !=nil && [resultDic count] > 0){
            if ([[resultDic objectForKey:@"success"] isEqualToString:@"true"]){
                NSDictionary * infoDic = [resultDic objectForKey:@"info"];
                NSLog(@"infoDic:%@",infoDic);
                for (NSDictionary * dic in infoDic) {
                    NSLog(@"dic:%@",dic);
                    Travel * travel = [[Travel alloc]init];
                    travel.id = [dic objectForKey:@"id"];
                    travel.tit = [dic objectForKey:@"tit"];
                    travel.url = [dic objectForKey:@"url"];
                    travel.gys = [dic objectForKey:@"gys"];
                    travel.phone = [dic objectForKey:@"phone"];
                    travel.dep = [dic objectForKey:@"dep"];
                    [dataArray addObject:travel];
                }
            }
        }
    }failure:^(AFHTTPRequestOperation * operation,NSError * error){
        NSLog(@"requestFail:%@",error);
    }];
    [operation start];
}

+ (void)requestXMLWithUrl:(NSURL *)url
{
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation,id XML){
        NSString * resultString = operation.responseString;
        NSLog(@"requestSuccess:%@",resultString);
        NSData * resultData = [[NSData alloc]initWithData:[resultString dataUsingEncoding:NSUTF8StringEncoding]];
        //XML解析
        NSLog(@"resultData:%@",resultData);
    } failure:^(AFHTTPRequestOperation * operation,NSError * error){
        NSLog(@"requestFail:%@",error);
    }];
    [operation start];
}

- (UILabel *)subLableWithLable:(UILabel *)lable andContent:(NSString *)string
{
    UIFont *content_font = [UIFont systemFontOfSize:16.0f];
    CGSize content_size = CGSizeMake(300, 2000);
    CGSize content_labelSize = [string sizeWithFont:content_font constrainedToSize:content_size lineBreakMode:0];
    lable.frame = CGRectMake(0,0, 300, content_labelSize.height);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6.0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    lable.attributedText = attributedString;
    [lable sizeToFit];
    return lable;
}

@end
