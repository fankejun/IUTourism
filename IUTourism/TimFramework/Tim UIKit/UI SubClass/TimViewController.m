//
//  TimViewController.m
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimViewController.h"
#import "CommonMacro.h"
#import "TimRequest.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+Extension.h"

@interface TimViewController () <UIAlertViewDelegate>

@end

@implementation TimViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
    self.view.backgroundColor = [UIColor colorWithHex:VIEWCONTROLLER_BACKGROUNDCOLOR];
    
    [self setView];
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
    [[TimRequest deafalutRequest] removeAllResponder];
    
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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    [[TimRequest deafalutRequest] addResponder:self];
}

- (void)removeRequestResponder {
    [[TimRequest deafalutRequest] removeResponder:self];
}


#pragma mark - Set View
- (void)setView {
    
}


#pragma mark - Set Data

@end

@implementation TimViewController (Notification)

- (void)ObserveNotificationWithName:(NSString *)aName {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:aName object:nil];
}

- (void)ObserveNotificationWithName:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:aName object:anObject];
}

- (void)postNotification:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}

- (void)handNotification:(NSNotification *)notifacation {
    
}

@end

@implementation TimViewController (UIBarButtonItem)

- (void)setBackBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onBackButtonAction:)];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)setLeftBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onLeftButtonAction:)];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)setRightBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onRightButtonAction:)];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)onLeftButtonAction:(id)sender {
    
}

- (void)onBackButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onRightButtonAction:(id)sender {
    
}

@end
