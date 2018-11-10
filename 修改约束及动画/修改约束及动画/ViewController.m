//
//  ViewController.m
//  修改约束及动画
//
//  Created by 汪大强 on 2018/10/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 红色view */
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewW;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.redViewW.constant = 50.f;
    [UIView animateWithDuration:2.0 animations:^{
        // 强制刷新
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.redViewW.constant = 100;
        [UIView animateWithDuration:2.0 animations:^{
            [self.view layoutIfNeeded];
        }];
    }];
}


@end
