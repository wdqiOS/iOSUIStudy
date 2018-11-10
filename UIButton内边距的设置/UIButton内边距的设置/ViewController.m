//
//  ViewController.m
//  UIButton内边距的设置
//
//  Created by 汪大强 on 2018/9/29.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 按钮 */
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // 设置按钮的内边距
    // 设置内容的边距，包括图片和label
//    self.button.contentEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
    
    // 设置图片内边距
    self.button.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    
    // 设置标题内边距
    self.button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
}



@end
