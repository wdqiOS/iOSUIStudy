//
//  AppDelegate.m
//  程序启动原理
//
//  Created by 汪大强 on 2018/11/11.
//  Copyright © 2018 LZ. All rights reserved.
//

/**

 如果没有设置启动页面，默认它的屏幕的大小是4s大小
 LaunchScreen底层实现：把LaunchScreen,storyboard当中内容，生成一张图片

 PCH作用：
 1、存入一些公用的宏；
 2、导入公用的头文件；
 3、自定义log；
 
 原理：工程在编译过程中，把PCH文件当中所有内容导入到工程当中所有文件当中
 
 */

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    LZLOG(@"%@", NSStringFromCGSize([UIScreen mainScreen].bounds.size));
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
