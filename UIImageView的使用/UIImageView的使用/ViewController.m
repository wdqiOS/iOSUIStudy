//
//  ViewController.m
//  UIImageView的使用
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // 2.设置尺寸
//    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView.frame = self.view.bounds;
    
    // 3.设置背景颜色
    imageView.backgroundColor = UIColor.redColor;
    
    // 4. 设置图片
    imageView.image = [UIImage imageNamed:@"TestImageLarge"];
    
    // 5.设置图片模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    // 6.加毛玻璃
    // 6.1 创建UIToolBar对象
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    // 6.2 设置toolBar的frame
    toolBar.frame = imageView.bounds;
    // 6.3 设置毛玻璃样式
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.9;
    
    // 6.4 加到imageview中
    [imageView addSubview:toolBar];
    
    // 添加到控制器的view中
    [self.view addSubview:imageView];
    
}

-(void)test{
    // 1.1 创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] init];
    
    // 1.2 设置frame
    imageView.frame = CGRectMake(100, 100, 200, 100);
    
    // 1.3 设置背景颜色
    imageView.backgroundColor = UIColor.redColor;
    
    // 1.4 设置图片 (png不需要后缀)
    imageView.image = [UIImage imageNamed:@"TestImageLarge"];
    
    // 1.5 设置图片的模式
    /*
     UIViewContentModeRedraw, // 重新绘制（核心绘图）drawRact
     
     // 带有scale 表明图片有可能被拉伸或者压缩 // 完全压缩
     UIViewContentModeScaleToFill,
     
     // Aspect 比例，带有比例的缩放
     UIViewContentModeScaleAspectFit, // 宽高比不变 Fit适应
     UIViewContentModeScaleAspectFill,
     
     // 不带有scale 表明图片不会被拉伸或压缩
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    // 2.0 添加到v控制器的view上
    [self.view addSubview:imageView];
    
    // 裁剪多余的部分
    imageView.clipsToBounds = YES;
}


@end
