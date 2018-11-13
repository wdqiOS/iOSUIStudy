//
//  ViewController.m
//  UIApplication单例了解
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIApplication *app = [UIApplication sharedApplication];
    UIApplication *app2 = [UIApplication sharedApplication];
    NSLog(@"%p =--- %p", app, app2);
//    UIApplication *app3 = [[UIApplication alloc] init];
//    NSLog(@"%p =====", app3);
    
    LZPerson *p = [LZPerson sharedPerson];
    LZPerson *p1 = [LZPerson sharedPerson];
    NSLog(@"%p ------------ %p", p, p1);
    LZPerson *p3 = [[LZPerson alloc] init];
}


@end
