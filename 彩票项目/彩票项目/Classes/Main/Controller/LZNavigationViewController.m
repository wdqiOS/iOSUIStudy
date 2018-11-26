//
//  LZNavigationViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZNavigationViewController.h"

@interface LZNavigationViewController ()

@end

@implementation LZNavigationViewController

// 什么时候调用？当第一次初始化这个类的时候调用
// 作用：初始化这个类
+(void)initialize{
//   NSLog(@"%s", __func__);
    
    // 1. 获取导航条标识
    // 获取APP的导航条标识
    // appearance 是一个协议，只要遵守了这个协议，都有这个方法
    // [UINavigationBar appearance];如果这样写，有重大bug，全程序的导航条都统一样式
    // appearanceWhenContainedIn: 获取几个类的导航条标识
    // 只获取LZNavigationViewController类的标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[LZNavigationViewController class], nil];

    // 设置背景
    // UIBarMetricsDefault 设置背景图片只能用UIBarMetricsDefault模式 控制器viewcontroller的view尺寸{{0,64}, {375, 667}}
    // UIBarMetricsCompact 控制器view的尺寸{{0,0},{375, 667}}
    // 只要给导航设置背景图片只能用默认模式，但是控制器的view的尺寸是从64开始，高度 = 屏幕的高度 - 64
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 设置字体颜色大小
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

// 什么时候调用？当程序一启动的时候就会调用
// 作用：将当前类加载进内存，放在代码区
// 比main先调用，自动释放池还没创建，需要自己控制内存
//+(void)load{
//    NSLog(@"%s", __func__);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置背景
    // UIBarMetricsDefault 设置背景图片只能用UIBarMetricsDefault模式 控制器viewcontroller的view尺寸{{0,64}, {375, 667}}
    // UIBarMetricsCompact 控制器view的尺寸{{0,0},{375, 667}}
    // 只要给导航设置背景图片只能用默认模式，但是控制器的view的尺寸是从64开始，高度 = 屏幕的高度 - 64
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    // 设置字体颜色大小
//    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
