//
//  ViewController.m
//  图片折叠
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 上部图片 */
@property (weak, nonatomic) IBOutlet UIImageView *topImageV;
/** 下部图片 */
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageV;

/** 渐变层 */
@property(nonatomic, weak) CAGradientLayer *gradientL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1. 让上部图片只显示上半部分
    self.topImageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    self.topImageV.layer.anchorPoint = CGPointMake(0.5, 1);
  
    // 2. 让下部图片只显示下半部分
    self.bottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    
    self.bottomImageV.layer.anchorPoint = CGPointMake(0.5, 0);
    
    [self addGradientLayer];
   
}

-(void)gradientLayer{
    // 渐变层
    CAGradientLayer *gradientL = [CAGradientLayer layer];
    gradientL.frame = self.bottomImageV.bounds;
    // 设置渐变的颜色
    gradientL.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor];
    // 设置渐变的方向
    gradientL.startPoint = CGPointMake(0, 0);
    gradientL.endPoint = CGPointMake(1, 0);
    
    // 设置一个渐变到另一个渐变的起始位置
    gradientL.locations = @[@0.2,@0.6];
    
    [self.bottomImageV.layer addSublayer:gradientL];
}

// 拖动手势
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    // 获取移动的偏移量
    CGPoint transP = [sender translationInView:sender.view];
    // 让上部图片开始旋转
    
    if (transP.y > 200) {
        transP.y = 200;
    }
    
    CGFloat angle = transP.y * M_PI / 200;
    
    
    // 近大远小的感觉
    CATransform3D transform = CATransform3DIdentity;
    // -1 固定写法 300：眼睛离屏幕的距离
    transform.m34 = -1 / 300.0;
    
    self.gradientL.opacity = transP.y * 1 / 200.0 ;
    
//    self.topImageV.layer.transform = CATransform3DMakeRotation(-angle, 1, 0, 0);
    self.topImageV.layer.transform = CATransform3DRotate(transform, -angle, 1, 0, 0);
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        // usingSpringWithDamping: 弹性系数，越小弹性越大
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            // 渐变层设置为透明
            self.gradientL.opacity = 0;
            
            // 上部的图片复位
            self.topImageV.layer.transform = CATransform3DIdentity;
        } completion:nil];
        
    }
    
    
    
}

-(void)addGradientLayer{
    CAGradientLayer *gradientL = [CAGradientLayer layer];
    self.gradientL = gradientL;
    gradientL.frame = self.bottomImageV.bounds;
    // 设置渐变色
    gradientL.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor blackColor].CGColor];
    // 设置渐变透明(0:透明 1：不透明)
    gradientL.opacity = 0;
    
    [self.bottomImageV.layer addSublayer:gradientL];
}


@end
