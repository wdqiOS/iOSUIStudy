//
//  LZTestViewController.m
//  autolayout练习
//
//  Created by 汪大强 on 2018/10/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTestViewController.h"

@interface LZTestViewController ()

@end

@implementation LZTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
