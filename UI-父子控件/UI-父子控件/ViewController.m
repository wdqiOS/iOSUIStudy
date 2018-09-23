//
//  ViewController.m
//  UI-父子控件
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 黄色view
@property (weak, nonatomic) IBOutlet UIView *orangeView;

/* 数组 */
@property(nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

/*
-(void)loadView{
    [super loadView];
    NSLog(@"%s", __func__);
}
*/
/**
 1、系统调用
 2、控制器的view加载完毕的时候调用
 3、控件的初始化，数据的初始化（懒加载）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s", __func__);
   // 1.1 查看黄色view的父控件
//    NSLog(@"黄色view的父view:%@ ----- 控制器的view:%@", self.orangeView.superview, self.view);
    // 1.2 查看黄色view的子控件
//    NSLog(@"%@", self.orangeView.subviews);
    // 1.3 控制器view的子控件
//    NSLog(@"%@  ---- count === %zd", self.view.subviews, self.view.subviews.count);
    
    // 1.4 控制器的view的父控件
    NSLog(@"viewDidLoad ==== %@", self.view.superview);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear ==== %@", self.view.superview);
}

/**
 1、系统调用
 2、当控制器接收到内存警告调用
 3、去除一些不必要的内存，去除耗时的内存
 */
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    NSLog(@"%s", __func__);
    
    // 清空数据
    self.dataArray = nil;
}

/*
 测试内存警告
 */
-(void)test{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 10000000; i++) {
        UILabel *label = [[UILabel alloc] init];
        [arr addObject:label];
    }
    self.dataArray = arr;
}


@end
