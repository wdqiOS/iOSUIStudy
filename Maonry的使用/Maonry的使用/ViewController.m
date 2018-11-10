//
//  ViewController.m
//  Maonry的使用
//
//  Created by 汪大强 on 2018/10/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry/Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test3];
}

-(void)test3{
    // 1. 创建蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = UIColor.blueColor;
//    blueView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:blueView];
    // 2. 创建红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    redView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:redView];
    
    /*************  添加新的约束 ***************/
    // 3. 设置蓝色view约束
    [blueView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left).offset(30);
        make.bottom.equalTo(self.view.bottom).offset(-30);
        make.right.equalTo(redView.left).offset(-30);
        make.width.equalTo(redView.width);
        make.height.equalTo(50);
    }];
    
    // 4. 设置红色view的约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).with.offset(-30);
        make.top.equalTo(blueView.top);
        make.bottom.equalTo(blueView.bottom);
    }];
    
    /******** 更新约束*********/
    [blueView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(80);
    }];
    
    /********** 删除之前的约束，添加新的约束***********/
//    [blueView remakeConstraints:^(MASConstraintMaker *make) {
//
//    }];
}

-(void)test2{
    // 1. 创建红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    redView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:redView];
    
    // 2. 添加约束
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.centerY.mas_equalTo(self.view.mas_centerY);
//    }];
    
    // 简单写法一：
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.mas_equalTo(self.view);
//        make.centerX.mas_equalTo(self.view);
//        make.centerY.mas_equalTo(self.view);
    }];
}

-(void)test{
    // 1. 创建红色view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = UIColor.redColor;
    // 禁止autoresizing自动转换约束 masonry内部已经实现了可以不写
//    redView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:redView];
    
    // 2. 添加约束
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).multipliedBy(1.0).offset(20);
//        make.left.equalTo(self.view.mas_left).multipliedBy(1.0).offset(20);
//        make.right.equalTo(self.view.mas_right).multipliedBy(1.0).offset(-20);
//        make.bottom.equalTo(self.view.mas_bottom).multipliedBy(1.0).offset(-20);
//    }];
    
    // 简写方法一：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(20);
//        make.left.equalTo(self.view.mas_left).offset(20);
//        make.right.equalTo(self.view.mas_right).offset(-20);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
//    }];
    
    // 简写方法二：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(20);
//        make.left.offset(20);
//        make.right.offset(-20);
//        make.bottom.offset(-20);
//    }];
    
    // 简写方法三：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.left.offset(20);
//        make.right.and.bottom.offset(-20);
//    }];
    
    // 简写方法四：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(20);
//        make.right.bottom.offset(-20);
//    }];
    
    // 简写方法五：
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
//    }];
    
    // 简写方法六：
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];

    
}


@end
