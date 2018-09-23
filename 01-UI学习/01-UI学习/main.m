//
//  main.m
//  01-UI学习
//
//  Created by 汪大强 on 2018/9/22.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/*
 应用程序启动过程：
 1、加载一个storyboard（Main interface）
 2、加载storyboard里的控制器，箭头指向的控制器
 3、控制器会创建（加载）一个属于控制器的view
 */

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
