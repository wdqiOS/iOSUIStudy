//
//  ViewController.m
//  自定义layer
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

/*
 CALayer是定义在QuartzCore框架中的
 CGImageRef、CGColorRef两种数据类型是定义再CoreGraphics框架中的
 UIColor、UIImage是定义在UIKit框架中的
 
 QuartzCore框架和CoreGraphics框架是可以跨平台使用的
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.frame = CGRectMake(50, 50, 50, 50);
    
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"阿狸头像"].CGImage;
}


@end
