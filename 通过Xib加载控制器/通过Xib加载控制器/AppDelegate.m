//
//  AppDelegate.m
//  通过Xib加载控制器
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "AppDelegate.h"
#import "LZViewController.h"
#import "LZTwoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 2. 创建窗口根控制器
    // initWithNibName: 如果指定了特定的名称的xib，会去加载指定的xib
    // 如果指定的是nil
    // 1、判断有没有当前控制器相同名称的xib，如果有，自动加载跟它相同名称的xib
    // 2、如果没有跟它相同名称的xib，自动加载跟它相同名称并且是去掉controller(LZView)
//    LZViewController *vc = [[LZViewController alloc] initWithNibName:nil bundle:nil];
    // init底层会自动调用initWithNibName方法
//    LZViewController *vc = [[LZViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
    
    
    LZTwoViewController *vc = [[LZTwoViewController alloc] init];
    self.window.rootViewController = vc;
    // 3. 显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
