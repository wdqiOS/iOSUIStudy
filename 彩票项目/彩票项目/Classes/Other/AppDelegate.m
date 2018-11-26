//
//  AppDelegate.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "AppDelegate.h"
#import "LZTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

// LauncScreen > Launchimage

// 新项目
// 1. 确定主框架
// 2. 确定开发方式
// 3. 工程的配置(部署)


// 文件夹结构(MVC)
/*
 1. 让更多的功能复用；
 2. 方便多人开发；
 3. 当程序出现bug（改需求）快速定位;
 */

// 谁的事情谁管理(自己的事情自己做)
// 自定义
/*
 1. 自定义控制器：一般都需要自定义（处理复杂的业务逻辑）
 2. 自定义控件：当系统控件不能b满足的时候，一定要先还原系统的方法，再增加自己的方法
    例如：button 文字在左边图片在右边、数据模型、view
 */




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 2. 设置窗口根控制器
    // 2.1 创建窗口根控制器
    UITabBarController *tabBarVC = [[LZTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    
    
    // 3. 窗口显示
    [self.window makeKeyAndVisible];
    
    NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    
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
