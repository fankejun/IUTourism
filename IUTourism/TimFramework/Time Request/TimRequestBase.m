//
//  TimRequest.m
//  CRM
//
//  Created by TimTiger on 5/8/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimRequestBase.h"

@implementation ResponderObject

@end

@implementation TimRequestParam
+ (TimRequestParam *)paramWithURLSting:(NSString *)requestUrl andParams:(NSDictionary *)params {
    TimRequestParam *reqParam = [[TimRequestParam alloc]init];
    reqParam.params = params;
    reqParam.requestUrl = requestUrl;
    reqParam.method = RequestMethodPOST;
    reqParam.retryTimes = 1;
    reqParam.timeoutInterval = 20;
    reqParam.retryInterval = 2;
    return reqParam;
}
+ (TimRequestParam *)paramWithURLSting:(NSString *)requestUrl andParams:(NSDictionary *)params
                            withPrefix:(NSString *)prefix {
    TimRequestParam *reqParam = [[TimRequestParam alloc]init];
    reqParam.params = params;
    reqParam.requestUrl = requestUrl;
    reqParam.callbackPrefix = prefix;
    reqParam.method = RequestMethodPOST;
    reqParam.retryTimes = 1;
    reqParam.timeoutInterval = 20;
    reqParam.retryInterval = 2;
    return reqParam;
}

+ (TimRequestParam *)paramWithURLSting:(NSString *)requestUrl andParams:(NSDictionary *)params
                        additionParams:(NSDictionary *)otherPararms withPrefix:(NSString *)prefix {
    TimRequestParam *reqParam = [[TimRequestParam alloc]init];
    reqParam.params = params;
    reqParam.requestUrl = requestUrl;
    reqParam.callbackPrefix = prefix;
    reqParam.additionalParams = otherPararms;
    reqParam.method = RequestMethodPOST;
    reqParam.retryTimes = 1;
    reqParam.timeoutInterval = 20;
    reqParam.retryInterval = 2;
    return reqParam;
}
@end

@implementation TimRequestBase

- (id)init {
    self = [super init];
    if (self) {
        responders = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

//添加 网络回调响应者
- (void)addResponder:(id)responder {
    @synchronized(responder) {
        for (ResponderObject *obj in responders) {
            if (obj.object == responders) {
                return;
            }
        }
        ResponderObject *responderObj = [[ResponderObject alloc]init];
        responderObj.object = responder;
        [responders addObject:responderObj];
    }
}

//添加 网络回调响应者
- (void)removeResponder:(id)responder{
    @synchronized(responder) {
        for (ResponderObject *obj in responders) {
            if (obj.object == responders) {
                [responders removeObject:obj];
                break;
            }
        }
    }
}

- (void)removeAllResponder {
    @synchronized(responders) {
        [responders removeAllObjects];
    }
}

@end
