//
//  ViewController.m
//  调整UIButton内部子控件的位置
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 1.1 创建按钮
    LZButton *button = [LZButton buttonWithType:UIButtonTypeCustom];
    
    // 1.2 设置frame
    button.frame = CGRectMake(100, 100, 170, 70);
    
    // 1.3 设置背景颜色
    button.backgroundColor = UIColor.purpleColor;
    
    // 1.4 设置文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    
    // 1.5 设置内容图片
    [button setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    
    // 1.6 改变内部子控件位置
    button.imageView.backgroundColor = UIColor.yellowColor;
    button.titleLabel.backgroundColor = UIColor.blueColor;
    
    // 注意：在按钮外边改的尺寸，按钮的内部都会覆盖掉
    /*
    button.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    button.imageView.frame = CGRectMake(100, 0, 70, 70);
    */
    
    [self.view addSubview:button];
}


@end
