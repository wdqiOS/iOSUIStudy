//
//  ViewController.m
//  Modal
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTwoViewController.h"


@interface ViewController ()

/** UIViewController */
@property(nonatomic, strong) UIViewController *twoVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --------------------
#pragma mark - 按钮点击事件

- (IBAction)modalButtonClick:(UIButton *)sender {
    
    LZTwoViewController *twoVC = [[LZTwoViewController alloc] init];
    // 当在modal时，会把窗口上面的view给移除，然后要modal控制器的view，给添加到窗口上
    
    // 如果当一个控制器被销毁，那么它view的业务逻辑是没有办法处理
    // 控制器被销毁，控制器的view不一定被销毁（只要有强指针指向它，就不会被销毁）
    // 被当前控制器 presentedViewController 属性强引用着，modal完成后不会被销毁
    
   

    [self presentViewController:twoVC animated:true completion:^{
        NSLog(@"%@", [UIApplication sharedApplication].keyWindow.rootViewController);
        NSLog(@"%@", self.presentedViewController);
        
    }];
    
    
//    self.twoVC = twoVC;
//    // 自己实现modal效果
//    CGRect frame = twoVC.view.frame;
//    frame.origin.y = [UIScreen mainScreen].bounds.size.height;
//    twoVC.view.frame = frame;
//    [[UIApplication sharedApplication].keyWindow addSubview:twoVC.view];
//    [UIView animateWithDuration:0.5 animations:^{
//        twoVC.view.frame = self.view.frame;
//    } completion:^(BOOL finished) {
//        [self.view removeFromSuperview];
//    }];
    
}


@end
