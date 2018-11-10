//
//  ViewController.m
//  UIButton(在代码中的使用)
//
//  Created by 汪大强 on 2018/9/26.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 创建按钮对象
    // 注意：设置按钮的类型只能在初始化的时候设置--> UIButtonTypeCustom
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 1.2 设置frame
    button.frame = CGRectMake(100, 100, 170, 60);
    
    // 1.3 设置背景颜色
    // 背景颜色不分状态
//    button.backgroundColor = UIColor.blueColor;
    
    // 1.4 设置文字
    // 按钮分状态不能这样设置文本
//    button.titleLabel.text = @"点击我哦";
//    button.titleLabel.frame = CGRectMake(0, 0, 60, 50);
//    button.titleLabel.textColor = UIColor.redColor;

    [button setTitle:@"点击我哦" forState:UIControlStateNormal];
    [button setTitle:@"已经点击" forState:UIControlStateHighlighted];
    
    // 1.5 设置文字颜色
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.greenColor forState:UIControlStateHighlighted];
    
    // 1.6 设置文字阴影颜色
    [button setTitleShadowColor:UIColor.blackColor forState:UIControlStateNormal];
    [button setTitleShadowColor:UIColor.whiteColor forState:UIControlStateHighlighted];
    
    button.titleLabel.shadowOffset = CGSizeMake(2, 2);
    
    // 1.7 设置图片
    [button setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateHighlighted];
    
    // 1.8
    button.imageView.backgroundColor = UIColor.redColor;
    
    // 1.9 设置背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    
    // 2.加载控制器的view中
    [self.view addSubview:button];
    
    button.center = self.view.center;
    
    // 非常重要
    
    /**
     监听按钮的点击
     Target: 目标（让谁做事情）
     action: 方法（做什么事情->方法）
     Events: 事件
     */
//    SEL sel = @selector(clickButton:);
    [button addTarget:self action:@selector(demo) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)demo{
    NSLog(@"%s", __func__);
}

- (IBAction)clickButton:(UIButton *)sender {
    
//    NSLog(@"%@", sender);
    
    sender.enabled = false;
    
    
}


@end
