//
//  ViewController.m
//  心跳动画效果
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 1. 创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 2. 设置属性
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    
    // 设置动画执行次数
    anim.repeatCount = MAXFLOAT;
    // 设置动画执行时长
    anim.duration = 1;
    
    // 自动翻转(怎么样去怎么样回来)
    anim.autoreverses = YES;
    
    
    // 3. 添加动画
    [self.imageV.layer addAnimation:anim forKey:nil];
    
}


@end
