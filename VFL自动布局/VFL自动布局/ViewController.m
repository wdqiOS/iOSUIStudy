//
//  ViewController.m
//  VFL自动布局
//
//  Created by 汪大强 on 2018/10/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test2];
}


-(void)test2{
    
    // 1. 蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = UIColor.blueColor;
    // 禁止autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:blueView];
    
    // 2. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    // 禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:redView];
    
    // 3. 添加约束
    // 3.1 水平方向
//    NSDictionary *views = @{
//                            @"redView" : redView,
//                            @"blueView" : blueView
//                            };
    NSDictionary *views = NSDictionaryOfVariableBindings(redView, blueView);
    NSDictionary *metrics = @{
                              @"space" : @30
                              };
    NSString *hvfl = @"H:|-30-[blueView]-30-[redView(==blueView)]-30-|";
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    
    // 3.2 垂直方向
    NSString *vvfl = @"V:[redView(40)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
    
    /*
    // 3.3 顶部对齐
    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:toplcs_r];
    
    // 3.4 底部对齐
    NSLayoutConstraint *bottomlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomlcs_r];
     */
}


-(void)test{
    // 1. 红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    // 禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:redView];
    
    // 2. 添加约束
    // 2.1 水平方向
    NSString *hvfl = @"H:|-space-[abc]-space-|";
    NSDictionary *views = @{@"abc": redView};
    NSDictionary *metrics = @{@"space": @50};
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    // 2.2 垂直方向
    NSString *vvfl = @"V:[abc(40)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
    
}


@end
