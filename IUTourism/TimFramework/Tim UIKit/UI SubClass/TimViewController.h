//
//  TimViewController.h
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma Type Define
typedef NS_ENUM(NSUInteger, EventType) {
    EventTypeXXX = 1,
};

@interface TimViewController : UIViewController

@property (nonatomic,readwrite) EventType eventType;

//相当于self.navigationviewcontroller push的功能
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popViewControllerAnimated:(BOOL)animated;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

@end


@interface TimViewController (Notification)

//监听某个通知
- (void)ObserveNotificationWithName:(NSString *)aName;
- (void)ObserveNotificationWithName:(NSString *)aName object:(id)anObject;

//发送通知
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(id)anObject;
- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

//监听到通知后的处理函数
- (void)handNotification:(NSNotification *)notifacation;

@end

@interface TimViewController (UIBarButtonItem)

- (void)setBackBarButtonWithImage:(UIImage *)image;
- (void)setRightBarButtonWithImage:(UIImage *)image;
- (void)setLeftBarButtonWithImage:(UIImage *)image;
- (void)onBackButtonAction:(id)sender;
- (void)onRightButtonAction:(id)sender;
- (void)onLeftButtonAction:(id)sender;

@end