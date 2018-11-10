//
//  ViewController.m
//  xib自定义View
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZShopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 加载xib
//    LZShopView *shopView = [[[NSBundle mainBundle] loadNibNamed:@"LZShopView" owner:nil options:nil] firstObject];
    /*
     xib注意：
     1、不能使用alloc init方法创建
     2、
     */
    LZShopView *shopView = [LZShopView shopView];
    shopView.frame = CGRectMake(100, 100, 80, 100);
    
    // 方法一：根据tag获取对应的值 开发中不宜使用
    /**
    // 给子控件设置属性
    UIImageView *imageView = [shopView viewWithTag:100];
    UILabel *titleLabel = [shopView viewWithTag:200];
    
    imageView.image = [UIImage imageNamed:@"TestImage"];
    titleLabel.text = @"测试图片";
     */
    
    [shopView setIcon:@"TestImage"];
    [shopView setName:@"测试图片"];
    
     [self.view addSubview:shopView];
    
}


@end
