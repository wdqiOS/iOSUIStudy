//
//  ViewController.m
//  UIView动画和核心动画区别
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

/*
 UIView动画与核心动画的区别？
 1. 核心动画只作用于layer
 2. 核心动画看到都是假象，他并没有修改UIView的真实位置
 
 什么时候使用核心动画？
 1. 当不需要与用户进行交互，使用核心动画。
 2. 当要根据路径做动画时，要使用核心动画。
 3. 做转场动画时，使用核心动画（转场类型比较多）。
 
 什么时候使用UIView动画？
 
 
 */

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
/** 红色view对象 */
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
  
    
  
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 核心动画
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"position.y";
//    anim.toValue = @400;
//    anim.removedOnCompletion = false;
//    anim.duration = 1;
//    anim.delegate = self;
//    anim.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:anim forKey:nil];
    
    // UIView动画
    [UIView animateWithDuration:1 animations:^{
        self.redView.center = CGPointMake(50, 400);
    } completion:^(BOOL finished) {
        NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
    }];
    
   
}

#pragma mark --------------------
#pragma mark - UIView动画
-(void)transitionWithView{
    // UIView转场动画
    [UIView transitionWithView:self.redView duration:2 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        // 转场代码
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark --------------------
#pragma mark - CAAnimationDelegate

// 动画开始时执行
-(void)animationDidStart:(CAAnimation *)anim{
//    NSLog(@"%s", __func__);
}
// 动画完成时执行
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    NSLog(@"%s", __func__);
//    NSLog(@"finished ==== %@", NSStringFromCGRect(self.redView.frame));
}


@end
