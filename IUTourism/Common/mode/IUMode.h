//
//  IUMode.h
//  IUTourism
//
//  Created by mac on 14-5-30.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IUMode : NSObject

@end


@interface Travel : IUMode

@property (nonatomic,copy) NSString *id;    //当前编号
@property (nonatomic,copy) NSString *tit;   //标题
@property (nonatomic,copy) NSString *url;   //图片地址
@property (nonatomic,copy) NSString *gys;   //旅行社名称
@property (nonatomic,copy) NSString *phone; //旅行社电话
@property (nonatomic,copy) NSString *dep;   //描述

@end