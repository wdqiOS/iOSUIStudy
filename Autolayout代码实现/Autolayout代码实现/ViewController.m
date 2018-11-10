//
//  ViewController.m
//  Autolayout代码实现
//
//  Created by 汪大强 on 2018/10/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self test2];
    
    
    
    
}

#pragma mark --------------------
#pragma mark - 测试二
-(void)test2{
    // 1. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    // 禁止autoresizing自动转换
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 2. 蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = UIColor.blueColor;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    
    // 设置约束
    // 3. 添加蓝色view约束
    // 3.1 左边约束
    NSLayoutConstraint *leftlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:leftlcs_b];
    
    // 3.2 底部约束
    NSLayoutConstraint *bottomlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30];
    [self.view addConstraint:bottomlcs_b];
    
    // 3.3 右边约束
    NSLayoutConstraint *rightlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_b];
    
    // 3.4 宽度约束
    NSLayoutConstraint *wlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:wlcs_b];
    
    // 3.5 高度约束
    NSLayoutConstraint *hlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [blueView addConstraint:hlcs_b];
    
    // 4. 添加红色view
    // 4.1 右边约束
    NSLayoutConstraint *rightlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_r];
    
    // 4.2 顶部对齐
    NSLayoutConstraint *tlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:tlcs_r];
    
    // 4.3 底部对齐
    NSLayoutConstraint *blcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:blcs_r];
    
    
}

#pragma mark --------------------
#pragma mark - 测试
-(void)test{
    // 1. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    [self.view addSubview:redView];
    
    // 禁止autoresizing自动转换为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    // 2. 添加约束
    // 2.1 添加宽度约束
    NSLayoutConstraint *wlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [redView addConstraint:wlcs];
    // 2.2 添加高度约束
    NSLayoutConstraint *hlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [redView addConstraint:hlcs];
    // 2.3 右边约束
    NSLayoutConstraint *rlcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rlcs];
    // 2.4 底部约束
    NSLayoutConstraint *blcs = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:blcs];
}


@end
