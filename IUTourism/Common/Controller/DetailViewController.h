//
//  DetailViewController.h
//  IUTourism
//
//  Created by mac on 14-6-6.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimViewController.h"

@interface DetailViewController : TimViewController <UIWebViewDelegate>
{
    UIWebView * myWebView;
    NSString * loadUrlString;
    UIActivityIndicatorView * activityView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil AndWithUrl:(NSString *)urlString;
@end
