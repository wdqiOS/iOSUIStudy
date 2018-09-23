//
//  ViewController.m
//  UIView常用方法
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 红色view
//@property (weak, nonatomic) IBOutlet UIView *redView;
// 红色view
@property(nonatomic, weak) UIView *redView;

@end

/*
 尽量少使用tag:
 1> tag的效率非常差
 2> tag使用多了，容易乱
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 根据tag拿到对应的view
    UIView *redView = [self.view viewWithTag:1];
    self.redView = redView;
    // 1.1 创建UISwitch对象
    UISwitch *sw = [[UISwitch alloc] init];
    
    // 1.2 加到控制器view上
    [self.view addSubview:sw];
    
    // 1.3 创建UISwitch对象
    UISwitch *sw1 = [[UISwitch alloc] init];
    
    // 1.4 加到红色view中
    [redView addSubview:sw1];
    
    // 1.5 创建一个选项卡对象
    UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"哈哈", @"呵呵", @"嘿嘿"]];
    // 1.6 添加到红色view上
    [redView addSubview:sg];
    
    // 1.7 移除
//    [sg removeFromSuperview];
//    [self.redView removeFromSuperview];
    
    NSLog(@"count === %@", redView.subviews);
}

#pragma mark --------------------
#pragma mark - 伪代码实现 viewWithTag:
-(UIView *)viewWithTag:(NSInteger)tag{
    if (self.view.tag == tag) return  self.view;
    for (UIView *subView in self.view.subviews) {
        if (subView.tag == tag) return subView;
        // 继续递归遍历
        // ...
    }
    return nil;
}

// 只要控件有父控件，就一定能够移除
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.view removeFromSuperview];
}

- (IBAction)removeRedView:(UIButton *)sender {
    [self.redView removeFromSuperview];
}


- (IBAction)btnClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 3:
        {
            NSLog(@"点击button3");
        }
            break;
        case 4:
        {
            NSLog(@"点击button4");
        }
            break;
        case 5:
        {
            NSLog(@"点击button5");
        }
            break;
        default:
            break;
    }
    NSLog(@"%s", __func__); 
    
}

@end
