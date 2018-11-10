//
//  ViewController.m
//  autoresizing的使用
//
//  Created by 汪大强 on 2018/10/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 1. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    
    CGFloat X = self.view.frame.size.width - 100;
    CGFloat Y = self.view.frame.size.height - 100;
    redView.frame = CGRectMake(X, Y, 100, 100);
    
    /**
     UIViewAutoresizingNone                 = 0,        // 没有使用autoresizing
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,   // 距离父控件的左边是可以伸缩的
     UIViewAutoresizingFlexibleWidth        = 1 << 1,   // 宽度会跟随父控件的宽度进行伸缩
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,   // 距离父控件的右边是可以伸缩的
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,   // 距离父控件的顶部是可以伸缩的
     UIViewAutoresizingFlexibleHeight       = 1 << 4,   // 高度会跟随父控件的高度进行伸缩
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5    // 距离父控件的底部是可以伸缩的
     */
    
    redView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:redView];
    
    
    
}


@end
