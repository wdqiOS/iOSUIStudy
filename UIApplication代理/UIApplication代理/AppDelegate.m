//
//  AppDelegate.m
//  UIApplication代理
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __func__);
    return YES;
}

// 应用程序将要失去焦点时调用
//
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

// 应用程序进入到后台时使用
- (void)applicationDidEnterBackground:(UIApplication *)application {
   NSLog(@"%s", __func__);
}

// 应用程序进入到前台时使用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

// 应用程序获取焦点时调用
// 焦点：能否与用户进行交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

// 应用程序将要退出的时候调用
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

// 当应用收到内存警告时调用
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    // 清理缓存、图片、视频
    NSLog(@"%s", __func__);
}

@end
