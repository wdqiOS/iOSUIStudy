//
//  ViewController.m
//  UIImageView的frame设置
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
    // 方式一：
    /*
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"1"];
    // 设置frame的方式
    
//    imageView.frame = CGRectMake(100, 100, 80, 60);
//    imageView.frame = (CGRect){{100,100},{160,120}};
     */
     // 方式二：
    /*
    UIImageView *imageView = [[UIImageView alloc] init];
    // 创建一个UIImage对象
    UIImage *image = [UIImage imageNamed:@"1"];
    // 设置frame
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    // 设置图片
    imageView.image = image;
    */
    // 方式三：
    /*
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 10, image.size.width, image.size.height)];
    imageView.image = image;
    */
    // 方式四：
    // 创建一个UIImageView对象
    // 注意：initWithImage 默认就有尺寸 ---》图片尺寸
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    // 改变位置
//    imageView.center = CGPointMake(200, 150);
    imageView.center = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    
    [self.view addSubview:imageView];
}


@end
