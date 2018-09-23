//
//  MainViewController.m
//  01-UI学习
//
//  Created by 汪大强 on 2018/9/22.
//  Copyright © 2018年 LZ. All rights reserved.
//

/*
 判断一个对象是否能连线的方法：
 看该对象的类是否继承于UIControl
 */

#import "MainViewController.h"

@interface MainViewController ()

// 已经有强指针指向
@property(nonatomic, weak)IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *redButton;


@end

@implementation MainViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.label.textAlignment = NSTextAlignmentCenter;
}


#pragma mark --------------------
#pragma mark - 点击红色按钮
-(IBAction)clickRedButton{
    NSLog(@"%s", __func__);
    self.label.textColor = UIColor.redColor;
    self.label.text = @"我是红色文字";
    self.label.backgroundColor = UIColor.greenColor;
    self.label.font = [UIFont systemFontOfSize:20.f];
}

#pragma mark --------------------
#pragma mark - 点击绿色按钮
-(IBAction)clickGreenButton{
    NSLog(@"%s", __func__);
    self.label.textColor = UIColor.greenColor;
    self.label.text = @"我是绿色的文字";
    self.label.backgroundColor = UIColor.redColor;
    self.label.font = [UIFont systemFontOfSize:30.f];
}

#pragma mark --------------------
#pragma mark - 点击蓝色按钮
-(IBAction)clickBlueButton{
    NSLog(@"%s", __func__);
    self.label.textColor = UIColor.blueColor;
    self.label.text = @"我是hello world！！";
    self.label.backgroundColor = UIColor.yellowColor;
    self.label.font = [UIFont systemFontOfSize:40.f];
}

@end
