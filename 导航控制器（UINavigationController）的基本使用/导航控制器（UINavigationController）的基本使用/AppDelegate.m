//
//  AppDelegate.m
//  导航控制器（UINavigationController）的基本使用
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 2. 设置窗口的根控制器
    
    // 创建控制器，并不一定会创建控制器的view
    ViewController *vc = [[ViewController alloc] init];
//    vc.view.backgroundColor = [UIColor redColor];
    // 创建导航控制器(initWithRootViewController内部实现原理:调用了pushViewController方法)
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    NSLog(@"%p", nav);
    // 导航控制器会把根控制器的view添加到存放子控制器的view上
    // 导航控制器的根控制器，其实就是导航控制器的第一个控制器
    // 将一个控制器添加到导航控制器当中
//    [nav pushViewController:vc animated:true];
    self.window.rootViewController = nav;
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
