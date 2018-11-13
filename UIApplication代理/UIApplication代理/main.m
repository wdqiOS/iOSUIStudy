//
//  main.m
//  UIApplication代理
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 第三个参数：设置是应用程序对象的名称UIApplication或者是它的子类，如果是nil，默认是UIApplication
        // 第四个参数：
        // NSStringFromClass：将类名转成字符串
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/**
 1. 执行main函数
 2. 执行UIApplicationMain
 3. 开启一个事件循环,(主运行循环，死循环：保证应用程序不退出)
 4. 去加载info.plist(判断info.plist当中有没有Main,如果有，加载Main.storyboard)
 5. 应用程序启动完毕。（通知代理应用程序启动完毕）
 
 */
