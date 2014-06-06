//
//  Request.h
//  IUTourism
//
//  Created by mac on 14-5-29.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

+ (void)requestJSONWithUrl:(NSURL *)url;

+ (void)requestXMLWithUrl:(NSURL *)url;

@end
