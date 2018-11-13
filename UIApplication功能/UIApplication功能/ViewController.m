//
//  ViewController.m
//  UIApplication功能
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)bageValue:(id)sender {
    // 设置提醒图标
    // 1. 获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    // 2. 注册用户通知(ios8.0以前注册方法，之后的注册方法不一致)
    UIUserNotificationSettings *notice = [UIUserNotificationSettings
                                          settingsForTypes:UIUserNotificationTypeBadge
                                          categories:nil];
    [app registerUserNotificationSettings:notice];
 
    // 3. 设置提醒值
    app.applicationIconBadgeNumber = 100;
}

- (IBAction)netState:(id)sender {
    // 设置联网状态
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = true;
}

- (IBAction)statueBar:(id)sender {
    // 设置状态栏
    UIApplication *app = [UIApplication sharedApplication];
    // 隐藏状态栏
//    app.statusBarHidden = NO;
    
    app.statusBarStyle = UIStatusBarStyleLightContent;
    
}

- (IBAction)openURL:(id)sender {
    // openURL
    UIApplication *app = [UIApplication sharedApplication];
    // 打电话
//    [app openURL:[NSURL URLWithString:@"tel://10086"]];
//    [app openURL:[NSURL URLWithString:@"tel://10086"] options:@{} completionHandler:^(BOOL success) {
//        NSLog(@"success ==== %d", success);
//    }];
    // 发短信
//    [app openURL:[NSURL URLWithString:@"sms://10086"] options:@{} completionHandler:^(BOOL success) {
//        NSLog(@"success ==== %d", success);
//    }];
    // 发邮件
//    [app openURL:[NSURL URLWithString:@"mailto://10086@qq.com"] options:@{} completionHandler:^(BOOL success) {
//        NSLog(@"success ==== %d", success);
//    }];
    // 打开一个网页
    [app openURL:[NSURL URLWithString:@"http://www.huanlejiaxiao.com"] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"success ==== %d", success);
    }];
    
}

#pragma mark --------------------
#pragma mark - 控制器控制当前页面的状态栏
// 状态栏样式
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
// 隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    return true;
}





@end
