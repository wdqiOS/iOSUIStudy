//
//  ViewController.m
//  CATransition(转场动画)
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
static int _i = 1;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 转场动画与转场代码必须得在同一个方法当中
    // 转场代码
    _i++;
    _i = (_i > 3) ? 1 : _i;
    NSString *imageNameString = [NSString stringWithFormat:@"%d", _i];
    self.imageV.image = [UIImage imageNamed:imageNameString];
    
    // 添加转场动画
    CATransition *anim = [CATransition animation];
    // 设置转场的类型
    anim.type = @"pageCurl";
//    anim.duration = 2;
    
    // 设置动画的起始位置
    anim.startProgress = 0.1;
    // 设置动画的结束位置
    anim.endProgress = 0.8;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
    
    
}


@end
