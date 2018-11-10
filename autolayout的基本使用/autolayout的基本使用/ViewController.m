//
//  ViewController.m
//  autolayout的基本使用
//
//  Created by 汪大强 on 2018/10/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

/**

 自动布局的核心计算公式
 
 obj1.property1 = (obj2.property2 * multipler) + constant value
 
 例子：
 黄色view.左边 = （父view的左边 * 0）+ 30
 黄色view.右边 = （紫色view的左边 * 1）+ 30
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
