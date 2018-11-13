//
//  LZRootViewController.m
//  loadView方法
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZRootViewController.h"
#import "LZView.h"

@interface LZRootViewController ()

@end

@implementation LZRootViewController

//-(void)loadView{
//    // self.view为空，使用self.view.bouns时，会调用loadview方法，陷入死循环
////    LZView *lzV = [[LZView alloc] initWithFrame:self.view.bounds];
//    LZView *lzV = [[LZView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    lzV.backgroundColor = [UIColor redColor];
//    self.view = lzV;
//
//    // 如果一个控件不能接收事件，那么它里面的子控件也是不能接收事件的
////    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
////    imageV.backgroundColor = [UIColor redColor];
////    self.view = imageV;
//
//}

// 当控制器view加载完毕时调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.view);
//
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
//    [self.view addSubview:imageV];
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn.frame = CGRectMake(50, 40, 50, 50);
//    [self.view addSubview:btn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
