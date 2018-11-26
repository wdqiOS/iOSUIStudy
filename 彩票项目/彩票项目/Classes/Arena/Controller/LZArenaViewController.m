//
//  LZArenaViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZArenaViewController.h"

@interface LZArenaViewController ()

@end

@implementation LZArenaViewController

// 当第一次加载view的时候调用
// 如果自定义view，重写这个方法
- (void)loadView{
    // 在这个方法里面不能调用self.view.bouncs,如果调用会造成死循环
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.view = imageView;
    // 设置背景图片
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    // 设置允许与用户交互
    imageView.userInteractionEnabled = true;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 设置titleview
    UISegmentedControl *segMentControl = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    // 设置背景图片(默认状态)
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 选中状态
    [segMentControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    // 设置字体颜色
    [segMentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}
                                  forState:UIControlStateNormal];
    // 默认选中下标
    segMentControl.selectedSegmentIndex = 0;
    
    // 设置前景色
    [segMentControl setTintColor:[UIColor colorWithRed:0 green:142/255.0f blue:143/255.f alpha:1]];
    
    self.navigationItem.titleView = segMentControl;
    NSLog(@"%@", segMentControl);
    
    
    
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
