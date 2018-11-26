//
//  AppDelegate.m
//  UITabBarController的基本使用
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blueColor];
    // 2. 设置窗口的根控制器
    // UITabBarController默认显示的是第一个子控制器的view
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.view.backgroundColor = [UIColor redColor];
    // 创建控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.title = @"首页";
    // 添加子控制器
//    [tabVC addChildViewController:vc1];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav.tabBarItem.title = @"消息";
    nav.tabBarItem.badgeValue = @"10";
//    nav.tabBarItem.badgeColor = [UIColor redColor];
    nav.tabBarItem.image = [UIImage imageNamed:@"hot"];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:@"hots"];
    [tabVC addChildViewController:nav];

    // 创建控制器
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    vc2.title = @"副页";
    vc2.tabBarItem.title = @"联系人";
    vc2.tabBarItem.image = [UIImage imageNamed:@"me"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"mes"];
    [tabVC addChildViewController:vc2];


    // 创建控制器
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor greenColor];
    vc3.title = @"末页";
    vc3.tabBarItem.title = @"动态";
    vc3.tabBarItem.image = [UIImage imageNamed:@"more"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"mores"];
    [tabVC addChildViewController:vc3];
    
    // 选中某一个子控制器
    tabVC.selectedIndex = 0;
    
    
    self.window.rootViewController = tabVC;
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
