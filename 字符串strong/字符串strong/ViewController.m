//
//  ViewController.m
//  字符串strong
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不可变字符串
     NSString *name = @"lz";
//    NSMutableString *name = [NSMutableString stringWithFormat:@"lz"];
    LZPerson *p = [[LZPerson alloc] init];
    p.name = name;
    
    NSLog(@"%p ============= %p", name, p.name);
}


@end
