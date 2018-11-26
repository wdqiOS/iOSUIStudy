//
//  ViewController.m
//  音量震动条
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 内容view */
@property (weak, nonatomic) IBOutlet UIView *contentV;

/** 复制层 */
@property(nonatomic, weak) CAReplicatorLayer *repL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.backgroundColor = UIColor.clearColor.CGColor;
    repL.frame = self.contentV.bounds;
    self.repL = repL;
    
    repL.instanceCount = 5;
    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    // 复制出来的子层动画延时执行
    repL.instanceDelay = 0.5;
    
    [self.contentV.layer addSublayer:repL];
    // 添加震动条
    [self layerLine];
    
    
    
    
//    // 创建一个震动条
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = UIColor.greenColor.CGColor;
//    layer.frame = CGRectMake(20, 30, 30, 50);
//    [repL addSublayer:layer];
//
//    CALayer *layer2 = [CALayer layer];
//    layer2.backgroundColor = UIColor.blueColor.CGColor;
//    layer2.frame = CGRectMake(20, 100, 30, 50);
//    [repL addSublayer:layer2];
//
//    // 赋值的份数（包括它自己）
//    repL.instanceCount = 3;
//    // 对复制出来的子层做形变操作（每一个都是相对于上一个子层做的形变）
//    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    
}



#pragma mark --------------------
#pragma mark - layer
-(void)layerLine{
    // 创建一个震动条
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.bounds = CGRectMake(0, 0, 30, 100);
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentV.bounds.size.height);
    [self.repL addSublayer:layer];
    
    // 添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
    anim.autoreverses = true;
    [layer addAnimation:anim forKey:nil];
}


@end
