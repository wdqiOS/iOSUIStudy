//
//  ViewController.m
//  通过storyboard跳转控制器
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 当控制器加载完毕时调用
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
}

// 当控制器的view即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

// 当控制器view显示完毕时调用
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}

// 当控制器的view将要布局子控件的时候调用
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%s", __func__);
}

// 当控制器view布局子控件完毕时调用
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s", __func__);
}

// 当控制器view即将消失时调用
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
}

// 当控制器view已经消失时调用
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
}


// 接收到内存警告
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
}


@end
