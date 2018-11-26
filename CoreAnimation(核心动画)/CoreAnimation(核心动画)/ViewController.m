//
//  ViewController.m
//  CoreAnimation(核心动画)
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 红色view对象 */
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 1. 创建动画对象(本质设置layer的属性值)
    CABasicAnimation *animation = [CABasicAnimation animation];
    // 设置属性值
    animation.keyPath = @"position";
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    // 动画完成时，会自动删除动画
    animation.removedOnCompletion = NO;
    animation.fillMode = @"forwards";
    // 3. 添加动画
    [self.redView.layer addAnimation:animation forKey:nil];
    
    
    
}




@end
