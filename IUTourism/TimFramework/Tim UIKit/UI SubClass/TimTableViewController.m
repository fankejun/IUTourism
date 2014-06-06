//
//  TimTableViewController.m
//  CRM
//
//  Created by TimTiger on 5/13/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimTableViewController.h"
#import "CommonMacro.h"
#import "UIColor+Extension.h"
#import "CRMHttpRequest.h"

@interface TimTableViewController ()

@end

@implementation TimTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#ifdef __IPHONE_7_0
    if (IOS_7_OR_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif
    if (IOS_7_OR_LATER) {
        if (!self.navigationController || [self.navigationController isNavigationBarHidden]) {
            self.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-20);
        } else {
            self.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);
        }
    }
    
    [self setupView];
    [self becomeRequestResponder]; //成为网络数据响应者
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //收到内存警告
    static int warning = 1;
    //所有网络请求响应体 移除
    [[CRMHttpRequest shareInstance] removeAllResponder];
    
    //页面回滚到最前页 【根据应用的结构不同这里应该自行调整代码
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    if (warning%20 == 0) { //每收到20次内存警告 提醒用户关闭一些后台程序！
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"内存警告" message:@"内存严重不足，请您关闭一些后台程序！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    warning++;
}

- (void)dealloc {
    [self removeRequestResponder];
}

#pragma mark Public API
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [super dismissViewControllerAnimated:flag completion:completion];
}

#pragma mark - Pvivate API
- (void)becomeRequestResponder {
    [[CRMHttpRequest shareInstance] addResponder:self];
}

- (void)removeRequestResponder {
    [[CRMHttpRequest shareInstance] removeResponder:self];
}


#pragma mark - Set View
- (void)setupView {
    
}


#pragma mark - Set Data


@end
