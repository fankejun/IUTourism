//
//  TimRequest.m
//  CRM
//
//  Created by TimTiger on 5/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "CRMHttpRequest.h"
#import <AFNetworking.h>

@interface CRMHttpRequest ()
{
    AFHTTPRequestOperationManager *requestManager;
}
@end

@implementation CRMHttpRequest

Realize_ShareInstance(CRMHttpRequest);

- (id)init {
    self = [super init];
    if (self) {
        self.BaseURL = [NSURL URLWithString:@"http://www.baidu.com"];
        _responderManager = [TimRequest deafalutRequest];
        requestManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:self.BaseURL];
    }
    return self;
}

/*
 *@brief 发起一个网络请求
 *@param params 请求参数
 */
- (void)requestWithParams:(TimRequestParam *)params {
    if (params.additionalParams != nil) {
        //有附加参数的（图片，文件等）
        
        [self POST:params.requestUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
             for (NSString *key in params.additionalParams) {
                 if ([key isEqualToString:@"pic"]) {
                     [formData appendPartWithFileData:[params.additionalParams objectForKey:key]
                                                 name:@"pic"
                                             fileName:[NSString stringWithFormat:@"pic.jpg"]
                                             mimeType:@"image/jpg"];
                 }
                 else if ([key isEqualToString:@"voice"]) {
                     NSData *amrData = [NSData dataWithContentsOfFile:[params.additionalParams objectForKey:key]];
                     [formData appendPartWithFileData:amrData
                                                 name:@"voice"
                                             fileName:[NSString stringWithFormat:@"voice_%d.amr", 10]
                                             mimeType:@"audio/amr"];
                 }
                 else if ([key isEqualToString:@"file"]) {
                     NSString* fileName = [params.params stringForKey:@"filename"];
                     NSData *zipData = [NSData dataWithContentsOfFile:[params.additionalParams objectForKey:key]];
                     [formData appendPartWithFileData:zipData
                                                 name:@"file"
                                             fileName:fileName
                                             mimeType:@"application/zip"];
                 }
             }
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onRequestSucc:operation withResponse:responseObject withParam:params];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self onRequestFailure:operation withError:error withParam:params];
        }];
       
    } else {
        //没有附加参数的
        [self POST:params.requestUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onRequestSucc:operation withResponse:responseObject withParam:params];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self onRequestFailure:operation withError:error withParam:params];
        }];
    }
}

- (void)requestWithParams:(TimRequestParam *)params withMethod:(RequestMethod)method {
    if (method >= RequestMethodGET && method <= RequestMethodPUT){
        params.method = method;
    }
    
    if (params.method == RequestMethodPOST) {
        [self requestWithParams:params];
    } else if (params.method == RequestMethodGET) {
        [self GET:params.requestUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self onRequestSucc:operation withResponse:responseObject withParam:params];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self onRequestFailure:operation withError:error withParam:params];
        }];
    }
}

//发送一个GET请求
- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(TimRequestParam *)params
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest *request = [requestManager.requestSerializer requestWithMethod:@"GET" URLString:[[NSURL URLWithString:URLString relativeToURL:requestManager.baseURL] absoluteString] parameters:params error:nil];
    request.timeoutInterval = params.timeoutInterval;
    AFHTTPRequestOperation *operation = [requestManager HTTPRequestOperationWithRequest:request success:success failure:failure];
    [requestManager.operationQueue addOperation:operation];
    
    return operation;
}

//发送一个POST请求
- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(TimRequestParam *)params success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest *request = [requestManager.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:requestManager.baseURL] absoluteString] parameters:params.params error:nil];
    request.timeoutInterval = params.timeoutInterval;
    AFHTTPRequestOperation *operation = [requestManager HTTPRequestOperationWithRequest:request success:success failure:failure];
    [requestManager.operationQueue addOperation:operation];
    
    return operation;
}

//发送一个POST请求
- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(TimRequestParam *)params
       constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSMutableURLRequest *request = [requestManager.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:requestManager.baseURL] absoluteString] parameters:params.params constructingBodyWithBlock:block error:nil];
    request.timeoutInterval = params.timeoutInterval;
    
    AFHTTPRequestOperation *operation = [requestManager HTTPRequestOperationWithRequest:request success:success failure:failure];
    [requestManager.operationQueue addOperation:operation];
    return operation;
}

#pragma mark - Request success/failure func
- (void)onRequestSucc:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject withParam:(TimRequestParam *)params {
    
    if (responseObject == nil) {
        responseObject = @{};
    }
    
    if (params != nil && params.callbackPrefix != nil) {
        SEL selector = NSSelectorFromString([NSString stringWithFormat:@"on%@RequestSuccess:", params.callbackPrefix]);
        if ([self respondsToSelector:selector]) {
            [self performSelector:selector withObject:[NSArray arrayWithObjects:operation, responseObject, params, nil]];
        }
    }
}


- (void)onRequestFailure:(AFHTTPRequestOperation *)operation withError:(NSError *)error withParam:(TimRequestParam *)params {
    if (error != nil && (error.code == NSURLErrorTimedOut ||
                         error.code == NSURLErrorCannotConnectToHost ||
                         error.code == NSURLErrorNetworkConnectionLost)) {

    }
    
    if (params != nil && params.callbackPrefix != nil) {
        SEL selector = NSSelectorFromString([NSString stringWithFormat:@"on%@RequestFailure:", params.callbackPrefix]);
        if ([self respondsToSelector:selector]) {
            [self performSelector:selector withObject:[NSArray arrayWithObjects:operation, error, params, nil]];
        }
    }
}


@end
