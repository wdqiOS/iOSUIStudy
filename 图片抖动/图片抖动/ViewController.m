//
//  ViewController.m
//  图片抖动
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

// 角度转弧度
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

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
    // 1. 创建动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(300, 50)];
    [path addLineToPoint:CGPointMake(300, 400)];
    // 2. 设置属性
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    anim.duration = 2;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = false;
    
    // 3. 添加动画
    [self.imageV.layer addAnimation:anim forKey:nil];
   
    
}





-(void)iconAnimation{
    // 1. 创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    // 2. 设置属性值
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angle2Rad(-3)), @(angle2Rad(3)), @(angle2Rad(-3))];
    // 设置动画执行次数
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
    // 自动翻转
    //    anim.autoreverses = true;
    // 3. 添加
    [self.imageV.layer addAnimation:anim forKey:nil];
}






@end
