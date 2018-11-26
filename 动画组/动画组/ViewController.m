//
//  ViewController.m
//  动画组
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
    // 1.
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @400;
//    anim.removedOnCompletion = false;
//    anim.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:anim forKey:nil];
    
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"transform.scale";
    anim2.toValue = @0.5;
//    anim2.removedOnCompletion = false;
//    anim2.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:anim2 forKey:nil];
    
    CABasicAnimation *anim3 = [CABasicAnimation animation];
    anim3.keyPath = @"transform.rotation";
    anim3.toValue = @(40 / 180.0 * M_PI);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 会自动执行animations数组当中的所有动画对象
    group.animations = @[anim, anim2, anim3];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self.redView.layer addAnimation:group forKey:nil];
    
}

@end
