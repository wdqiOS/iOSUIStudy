//
//  ViewController.m
//  xib的基本使用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 展示xib
    // 方式一：
//    UIView *carView  = [[[NSBundle mainBundle] loadNibNamed:@"CarView" owner:nil options:nil] firstObject];
//    [self.view addSubview:carView];
    
    // 方式二：
    UINib *nib = [UINib nibWithNibName:@"CarView" bundle:nil];
    UIView *view = [[nib instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:view];
    
}


@end
