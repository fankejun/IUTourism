//
//  AppDelegate.m
//  IUTourism
//
//  Created by mac on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "AppDelegate.h"
#import "CellViewController.h"
#import "TimNavigationViewController.h"
#import "MainViewController.h"
#import "CommonMacro.h"
#import "IUTourViewAppearance.h"
#import "PH4ViewController.h"
#import "PH5ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //测试时显示沙盒路径
    NSString * bPath = NSHomeDirectory();
    NSLog(@"%@",bPath);    
    
//    //显示界面
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
//    NSString *mainvcIdentifier = nil;
//    if (SCREEN_HEIGHT > 480) {
//        mainvcIdentifier = @"MainViewController_iPhone5";
//    } else {
//        mainvcIdentifier = @"MainViewController_iPhone4";
//    }
//    MainViewController *mainVC = [storyBoard instantiateViewControllerWithIdentifier:mainvcIdentifier];
//    TimNavigationViewController *nav = [[TimNavigationViewController alloc]initWithRootViewController:mainVC];
//    self.window.rootViewController = nav;
//    //通用的界面的设置
//    [IUTourViewAppearance setIUTourAppearance];
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    CellViewController * cellViewCtl = [[CellViewController	 alloc]init];
//    TimNavigationViewController *nav = [[TimNavigationViewController alloc]initWithRootViewController:cellViewCtl];
//    self.window.rootViewController = nav;
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    MainViewController * mainCtl = [[MainViewController alloc]init];
//    UINavigationController * nvc = [[UINavigationController alloc]initWithRootViewController:mainCtl];
//    [self.window setRootViewController:nvc];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TimViewController * tempViewCtl;
    if (SCREEN_HEIGHT > 480){
        tempViewCtl = [[PH5ViewController alloc]init];
    }else{
        tempViewCtl = [[PH4ViewController alloc]init];
    }
    TimNavigationViewController *nav = [[TimNavigationViewController alloc]initWithRootViewController:tempViewCtl];
    self.window.rootViewController = nav;
    
    [IUTourViewAppearance setIUTourAppearance];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
