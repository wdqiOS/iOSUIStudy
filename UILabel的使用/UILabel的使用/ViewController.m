//
//  ViewController.m
//  UILabel的使用
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/*
 storyboard创建的代码一定能创建，
 代码创建的storyboard不一定能创建
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.1 创建UILabel对象
    UILabel *label = [[UILabel alloc] init];
    
    // 1.2 设置frame
    label.frame = (CGRect){{50, 100},{80, 100}};
//    label.frame = CGRectMake(100, 100, 100, 100);
    // 1.3 设备背景颜色
    label.backgroundColor = UIColor.redColor;
    
    // 1.4 设置文本
    label.text = @"good good study, day day up !";
   
    
    // 1.5 居中
    label.textAlignment = NSTextAlignmentCenter;
    
    // 1.6 设置字体大小
    label.font = [UIFont systemFontOfSize:20.f];
    label.font = [UIFont boldSystemFontOfSize:25.f];
    label.font = [UIFont italicSystemFontOfSize:25.f];
    
    // 1.7 设置文本颜色
    label.textColor = UIColor.whiteColor;
    
    // 1.8 设置阴影(默认是有值)
    label.shadowColor = UIColor.blackColor;
    label.shadowOffset = CGSizeMake(-2, 1);
    
    // 1.9 设置行数
    label.numberOfLines = 0;
    
    // 2.0 显示模式
    /*
     NSLineBreakByWordWrapping = 0,         // Wrap at word boundaries, default
     NSLineBreakByCharWrapping,        // Wrap at character boundaries
     NSLineBreakByClipping,        // Simply clip
     NSLineBreakByTruncatingHead,    // Truncate at head of line: "...wxyz"
     NSLineBreakByTruncatingTail,    // Truncate at tail of line: "abcd..."
     NSLineBreakByTruncatingMiddle    // Truncate middle of line:  "ab...yz"
     */
    label.lineBreakMode = NSLineBreakByClipping;
    
    [label sizeToFit];
    // 2.0 添加到控制器的view中
    [self.view addSubview:label];
}


@end
