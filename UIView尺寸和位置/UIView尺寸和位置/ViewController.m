//
//  ViewController.m
//  UIView尺寸和位置
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) UILabel *label;
@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // frame(以父控件的左上角为坐标原点)
    // 创建UILabel对象
    UILabel *label = [[UILabel alloc] init];
    // 设置frame
    label.frame = CGRectMake(100, 100, 200, 60);
    label.text = @"hello world !";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.whiteColor;
    // 设置背景颜色
    label.backgroundColor = UIColor.redColor;
    // 添加到控制器的view中
    [self.view addSubview:label];
    self.label = label;
    // bouns（以自己的左上角为坐标原点，所以bounds的x、y一般为0）
    
    
    
}

- (IBAction)bounds {
    // 改变尺寸 iOS9以后，中心点不变，向四周延伸
    self.label.bounds = CGRectMake(0, 0, 300, 100);
}


- (IBAction)center {
    // 改变位置 以父控件左上角为坐标原点
//    self.label.center = CGPointMake(60, 120);
    
    // 显示在最中间
//    self.label.center = self.view.center;
    [UIView animateWithDuration:0.5 animations:^{
         self.label.center = CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    }];
}
- (IBAction)changeFrame {
    // 方式一：
//    self.label.frame = CGRectMake(200, 100, 200, 60);
    // 方式二：
    // 结构体是值传递，不是地址传递
    CGRect frame = self.label.frame;
//    frame.origin.x -= 100; // 改变x值
//    frame.origin.y += 100; // 改变y值
    frame.size.width += 50; // 改变宽度
    frame.size.height += 50; // 改变高度
    self.label.frame = frame;
    
}



@end
