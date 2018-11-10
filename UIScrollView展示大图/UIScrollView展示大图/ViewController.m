//
//  ViewController.m
//  UIScrollView展示大图
//
//  Created by 汪大强 on 2018/10/8.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 菊花指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = CGPointMake(100, -40);
    [indicatorView startAnimating];
    [self.scrollView addSubview:indicatorView];
    
    
    
    
    // 1. UIImageView
    UIImage *image = [UIImage imageNamed:@"内存优化"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    [self.scrollView addSubview:imageView];
    
    // 2. 设置contentSize
    self.scrollView.contentSize = image.size;
    
    // 4. 不管有没有设置contentSize,总是有弹簧效果(下拉刷新、上拉加载)
//    self.scrollView.alwaysBounceHorizontal = YES;
//    self.scrollView.alwaysBounceVertical = YES;
    
    // 5. 是否显示滚动条
//    self.scrollView.showsVerticalScrollIndicator = false;
//    self.scrollView.showsHorizontalScrollIndicator = false;
    
    // 注意点：千万不要通过索引subviews数组访问scrollview子控件
//   ❌❌ [self.scrollView.subviews.lastObject removeFromSuperview];
    
    // 6. contentOffset 内容的偏移量
    // 作用：控制内容滚动的位置
    //      得到内容滚动的位置
    self.scrollView.contentOffset = CGPointMake(200, -100);
    
    // 7.内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
}


@end
