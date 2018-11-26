//
//  ViewController.m
//  导航控制器（UINavigationController）的基本使用
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 自定义控制器view
//-(void)loadView{
//    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    view.backgroundColor = [UIColor greenColor];
//    self.view = view;
//}

/*
 控制器view的懒加载方式如下：
-(UIView *)view{
    if (_view == nil) {
        [self loadView];
        [self viewDidLoad];
    }
    return _view;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor blueColor];
    
    // 设置导航条内容
    // 由栈顶控制器来决定
    self.navigationItem.title = @"根控制器";
    // 设置标题视图
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    // 设置左侧标题
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:0 target:self action:@selector(leftClick)];
    // 设置右侧图片
    UIImage *rightImage = [UIImage imageNamed:@"me.png"];
    UIImage *oriImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:oriImage style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    
    // 设置右侧是一个自定义的view(位置不需要自己决定，但是大小是要自己决定)
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn setImage:[UIImage imageNamed:@"me.png"] forState:UIControlStateNormal];
//    [rightBtn setImage:[UIImage imageNamed:@"mes.png"] forState:UIControlStateHighlighted];
//    [rightBtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
//    // 按钮自适应大小
//    [rightBtn sizeToFit];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

#pragma mark --------------------
#pragma mark - 导航栏左右按钮点击
-(void)leftClick{
    NSLog(@"%s", __func__);
}
-(void)rightClick{
    NSLog(@"%s", __func__);
}

- (IBAction)jumpToNextVC:(id)sender {
    // 只有导航控制器才有跳转功能
    // 只要是导航控制器的子控制器就能拿到导航控制器
//    NSLog(@"%p", self.navigationController);
    [self.navigationController pushViewController:[[LZTwoViewController alloc] init] animated:true];
    
}

@end
