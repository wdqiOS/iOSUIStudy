//
//  ViewController.m
//  渐变动画
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)translate {
    // 渐变动画
    // 方式一：
    /*
    // 1.开始动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    // 2. 动画代码
    CGRect frame = self.targetView.frame;
    frame.origin.x -= 50;
    self.targetView.frame = frame;
    
    // 3. 提交动画
    [UIView commitAnimations];
     */
    
    // 方式二：block动画块儿
    /*
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.targetView.frame;
        frame.origin.x += 50;
        self.targetView.frame = frame;
    }];
     */
    /*
    [UIView animateWithDuration:1.0 animations:^{
        // 执行动画
        CGRect frame = self.targetView.frame;
        frame.origin.x += 50;
        self.targetView.frame = frame;
    } completion:^(BOOL finished) {
        // 动画完成之后做什么事情
        self.targetView.center = self.view.center;
    }];
     */
    
    /*
     UIViewAnimationOptionCurveEaseInOut   动画开始/结束比较缓慢
     UIViewAnimationOptionCurveEaseIn      动画开始比较缓慢
     UIViewAnimationOptionCurveEaseOut     动画结束比较缓慢
     UIViewAnimationOptionCurveLinear      线性---> 匀速
     */
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.targetView.frame;
        frame.origin.x += 50;
        self.targetView.frame = frame;
    } completion:^(BOOL finished) {
        self.targetView.center = self.view.center;
    }];
}

- (IBAction)scale {
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.targetView.frame;
        frame.size = CGSizeMake(100, 100);
        self.targetView.frame = frame;
        
    } completion:^(BOOL finished) {
        self.targetView.center = self.view.center;
    }];
}

- (IBAction)alpha {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.targetView.alpha -= 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.targetView.alpha += 0.9;
        }];
        self.targetView.center = self.view.center;
    }];
}



@end
