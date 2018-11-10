//
//  ViewController.m
//  UItableViewController基本使用
//
//  Created by 汪大强 on 2018/10/18.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self presentViewController:[LZTableViewController new] animated:true completion:nil];
}



@end
