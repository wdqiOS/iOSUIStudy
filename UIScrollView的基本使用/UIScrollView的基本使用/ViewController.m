//
//  ViewController.m
//  UIScrollView的基本使用
//
//  Created by 汪大强 on 2018/10/8.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** scrollView */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    
    // 默认scrollview设置该属性为yes
//    self.scrollView.clipsToBounds = NO;
    // 2. 设置内容尺寸(滚动范围)
    // 可滚动尺寸:contentSize的尺寸 减去 scrollview的尺寸
    // 注意点：contentSize的尺寸小于或等于scrollview的尺寸也是不可以滚动的
    self.scrollView.contentSize = CGSizeMake(400, 500);
    
    // 3. scrollview是否可以滚动
//    self.scrollView.scrollEnabled = false;
    // 4. 是否能够跟用户交互（响应用户的点击等操作）
    // 注意点：设置userInteractionEnabled = NO，scrollview以及内部所有的子控件都不能跟用户交互
//    self.scrollView.userInteractionEnabled = false;
    
    
    /*
    UIButton *btn = nil;
    btn.enabled = NO;
    btn.userInteractionEnabled = NO;
    // 注意点：只有设置按钮的enabled = NO才能达到这个状态；
    // 设置userInteractionEnabled = NO 是达不到这个状态 不可用状态的
     userInteractionEnabled 属性是UIView的
     enabled 属性是UIControl的
     */
}


@end
