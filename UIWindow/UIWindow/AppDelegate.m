//
//  AppDelegate.m
//  UIWindow
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

/*
 系统加载info.plist做的事情:
  1. 如果有Main,它会加载Main.storyboard
  2. 创建一个窗口
  3. 把Main.storyboard中箭头指向的控制器，设为窗口的根控制器
  4. 显示窗口（把窗口的根控制器的view，添加到窗口）
 */


#import "AppDelegate.h"

@interface AppDelegate ()

/** 文本输入框 */
@property(nonatomic, strong) UITextField *textF;

/** window1 */
@property(nonatomic, strong) UIWindow *window1;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1. 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blueColor];
    // 2. 一个窗口必须得有根控制器（设置窗口的根控制器）
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = vc;
//    NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
    NSLog(@"%@", self.window);
    // 3. 显示
    [self.window makeKeyAndVisible];
//    NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
     NSLog(@"%@", self.window);
//    self.window.hidden = false;
    
    // 从iOS9之后，如果添加了多个窗口，控制器它会自动把状态栏隐藏掉
    // 解决办法，把状态栏给应用程序管理
    self.window1 = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 375, 20)];
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor blueColor];
    self.window1.rootViewController = vc1;
    [self.window1 makeKeyAndVisible];
    
    // 设置窗口层级
    // UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
    self.window1.windowLevel = UIWindowLevelStatusBar;
    self.window.windowLevel = UIWindowLevelAlert;
    
    
    /*
        键盘、状态栏其实都是window
     */
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.textF = textF;
    // UITextField想要显示键盘，必须要添加到一个view上
    [vc.view addSubview:textF];
    [textF becomeFirstResponder];
    
    
    /*
     makeKeyAndVisible:
     1. 设置应用程序的主窗口
     2. 让窗口显示，把窗口hidden = no
     3. 把窗口的根控制器的view添加到窗口上,[self.window addsubView:rooterViewcontroller.view]
     */
    
    
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
