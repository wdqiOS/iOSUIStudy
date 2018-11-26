//
//  ViewController.m
//  hitTest练习2
//
//  Created by 汪大强 on 2018/11/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --------------------
#pragma mark - 按钮点击事件

- (IBAction)btnClick:(LZButton *)sender {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateHighlighted];
    
    sender.btn = btn;
    
    btn.frame = CGRectMake(100, -80, 100, 80);
    [sender addSubview:btn];
}


@end
