//
//  TimRequest.h
//  CRM
//
//  Created by TimTiger on 5/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimFramework.h"

@interface CRMHttpRequest : TimRequestBase
{
    
}
@property (nonatomic,readonly) TimRequest *responderManager;

Declare_ShareInstance(CRMHttpRequest);

/*
 *@brief 发起一个网络请求 默认POST方式
 *@param params 请求参数
 */
- (void)requestWithParams:(TimRequestParam *)params;

/*
 *@brief 发起一个网络请求
 *@param params 请求参数
 *@param method 请求方式
 */
- (void)requestWithParams:(TimRequestParam *)params withMethod:(RequestMethod)method;

@end
