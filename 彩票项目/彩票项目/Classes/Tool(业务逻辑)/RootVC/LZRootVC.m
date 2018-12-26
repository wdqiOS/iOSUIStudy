//
//  LZRootVC.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZRootVC.h"
#import "LZTabBarController.h"
#import "LZSaveTool.h"
#import "LZNewFeatureCollectionViewController.h"

#define LZVersion @"version"
@implementation LZRootVC

+(UIViewController *)chooseWindowRootVC{
    // 当有版本更新，或者第一次安装的时候提示习特性页面：
    // 1. 获取当前版本号
    NSString *currVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    // 2. 上一次版本号
    // 要存储上一个版本号
    //    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:LZVersion];
    NSString *lastVersion = [LZSaveTool objectForKey:LZVersion];
    UIViewController *rootVC;
    if (![currVersion isEqualToString:lastVersion]) { // 有版本更新
        // 进入新特性页面
        UIViewController *vc = [[LZNewFeatureCollectionViewController alloc] init];
        rootVC = vc;
        // 存储当前版本号
        //        [[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:LZVersion];
        //        [[NSUserDefaults standardUserDefaults] synchronize];
        [LZSaveTool setObject:currVersion forKey:LZVersion];
    }else{
        // 进入主框架
        rootVC = [[LZTabBarController alloc] init];
    }
    return rootVC;
}

@end
