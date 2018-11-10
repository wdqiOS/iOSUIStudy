//
//  ViewController.m
//  UIScrollView的代理
//
//  Created by 汪大强 on 2018/10/9.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZCar.h"

/**
 1. 任何OC对象都可以作为scrollview的代理，一般情况下用当前控制器作为代理，并不表示其他OC对象不能作为代理
 2. 苹果设计的代理模式为什么使用weak，避免循环引用，造成内存泄露
 */

@interface ViewController ()

/** scrollView */
@property(nonatomic, strong) UIScrollView *scrollView;

/** 车 */
@property(nonatomic, strong) LZCar *car;

@end

@implementation ViewController

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 20, 300, 200);
        _scrollView.backgroundColor = UIColor.redColor;
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 添加scrollview
    [self.view addSubview:self.scrollView];
    
    // 注意点：通过代码创建scrollview，一开始subviews这个数组为nil
    NSLog(@"%@", self.scrollView.subviews);
    
    // 2. 创建UIImageView
    UIImage *image = [UIImage imageNamed:@"bg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    
    // 3. 设置contentSize
    self.scrollView.contentSize = image.size;
  
    // 4. 设置scrollview代理
//    self.scrollView.delegate = self;
    self.car = [[LZCar alloc] init];
    self.scrollView.delegate = self.car;
    NSLog(@"00----");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark --------------------
#pragma mark - scrollView代理方法
/**
 当scrollview正在滚动的时候就会自动调用这个方法
 @param scrollView 滚动的scrollview对象
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%s", __func__);
}

/**
 用户即将开始拖拽scrollview时就会调用这个方法
 @param scrollView 拖拽的scrollview对象
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
}


/**
 用户即将停止拖拽

 @param scrollView 拖拽scrollview对象
 @param velocity <#velocity description#>
 @param targetContentOffset <#targetContentOffset description#>
 */
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%s", __func__);
}


/**
 用户已经停止拖拽

 @param scrollView 拖拽scrollview对象
 @param decelerate 是否有减速
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s", __func__);
    if (decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollview，停止滚动");
    }else{
        NSLog(@"用户已经停止拖拽scrollview，但是scrollview由于惯性会继续滚动，减速");
    }
}


/**
 scrollview减速完毕会调用，停止滚动

 @param scrollView 滚动的scrollview对象
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
}


@end
