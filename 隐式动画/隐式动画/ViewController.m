//
//  ViewController.m
//  隐式动画
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** layer对象 */
@property(nonatomic, weak) CALayer *layer;
/** 红色redview */
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 只有非根层才有隐式动画（自己手动创建的图层）
    //
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationDuration:2];
    // 修改位置
    self.layer.position = CGPointMake(100, 400);
    // 修改bounds
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    // 背景颜色
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    // 位置可以自己控制
    [CATransaction commit];
    
    
    
    
    // 修改位置
    self.redView.layer.position = CGPointMake(200, 400);
    // 修改bounds
    self.redView.layer.bounds = CGRectMake(0, 0, 100, 100);
    // 背景颜色
    self.redView.layer.backgroundColor = [UIColor greenColor].CGColor;
    
}


@end
