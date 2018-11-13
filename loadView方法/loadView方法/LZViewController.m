//
//  LZViewController.m
//  loadView方法
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZViewController.h"

@interface LZViewController ()

@end

@implementation LZViewController

/*
 loadview作用：用来加载控制器的view
 什么时候调用：当控制器的view，第一次使用的时候调用
 loadview底层原理：
 1. 先判断当前控制器是不是从storyBoard当中加载的，如果是从storyboard加载的控制器，那么它就会从storyboard当中加载的控制器的view，设置为当前控制器的view
 2. 当前控制器是不是从xib当中加载的，如果是从xib当中加载的，把xib当中指定的view，设置为当前控制器的view
 3. 如果也不是从xib加载的，它会创建空白的view
 */

// 一旦重写了loadview方法，就说明要自己定义view
// 一般使用的场景：当控制器的view显示时，就是一张图片，或者UIWebView
// 好处：节省内存
//-(void)loadView{
//    [super loadView];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
