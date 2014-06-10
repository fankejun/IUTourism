//
//  IUTourViewAppearance.m
//  IUTourism
//
//  Created by mac on 14-6-5.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "IUTourViewAppearance.h"
#import "TimFramework.h"
#import "IUTourMacro.h"

@implementation IUTourViewAppearance

+ (void)setIUTourAppearance
{
    //设置搜索条 cancel按钮颜色
    [[UIBarButtonItem appearanceWhenContainedIn:[TimSearchBar class], nil] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    
    //设置导航条 标题颜色
    [[TimNavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], UITextAttributeTextColor,nil]];
    
    //设置导航条 背景色
//    if (IOS_7_OR_LATER) {
//        [[TimNavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"headImage"] forBarMetrics:UIBarMetricsDefault];
//        [[TimNavigationBar appearance] setBarTintColor:[UIColor colorWithHex:NAVIGATIONBAR_BACKGROUNDCOLOR]];
//    } else if(IOS_5_OR_LATER) {
//        [[TimNavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"headImage"] forBarMetrics:UIBarMetricsDefault];
//        [[TimNavigationBar appearance] setTintColor:[UIColor colorWithHex:NAVIGATIONBAR_BACKGROUNDCOLOR]];
//    }
    
    //设置搜索条 背景色
    if (IOS_7_OR_LATER) {
        [[TimSearchBar appearance] setBarTintColor:[UIColor colorWithHex:SEARCH_BAR_BACKGROUNDCOLOR]];
    } else if (IOS_5_OR_LATER) {
        [[TimSearchBar appearance] setTintColor:[UIColor colorWithHex:SEARCH_BAR_BACKGROUNDCOLOR]];
    }

}

@end
