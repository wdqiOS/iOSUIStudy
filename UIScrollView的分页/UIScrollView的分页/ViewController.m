//
//  ViewController.m
//  UIScrollView的分页
//
//  Created by 汪大强 on 2018/10/9.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPageView.h"

@interface ViewController ()<UIScrollViewDelegate>

/** scrollView */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

/** 定时器 */
@property(nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // [self initUI];
    self.scrollView.hidden = true;
    self.pageControl.hidden = true;
    
    
    LZPageView *pageView = [LZPageView pageView];
    pageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 150);
    pageView.center = self.view.center;
    pageView.imageNames = @[@"dazhao_1", @"dazhao_2", @"dazhao_3", @"dazhao_4", @"dazhao_5"];
    [self.view addSubview:pageView];

    
}

-(void)initUI{
    
   
    
    NSInteger count = 5;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    // 1. 添加图片
    for (NSInteger i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"dazhao_%zd", i+1]];
        imageView.frame = CGRectMake(i*scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    // 2. 设置contentsize
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    // 3. 开启分页功能
    self.scrollView.pagingEnabled = true;
    
    // 4、设置pagecontrol页数
    self.pageControl.numberOfPages = count;
    
    // 5、设置单页的时候隐藏
    self.pageControl.hidesForSinglePage = true;
    
    // 6、通过KVC给pagecontrol设置图片
    [self.pageControl setValue:[UIImage imageNamed:@"player_btn_play_normal"] forKeyPath:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"player_btn_pause_normal"] forKeyPath:@"_pageImage"];
    
    [self startTimer];
}

// 线程：执行任务，同一时间只能处理一个任务
// 主线程：系统一启动，系统会默认创建一条线程
// 主线程作用：显示刷新UI界面，处理与用户的交互事件
// 多线程的原理：CPU在任务间的快速切换
#pragma mark --------------------
#pragma mark - 定时器相关方法
-(void)startTimer{
    // 返回一个自动执行的定时器对象
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                  target:self
                                                selector:@selector(nextPage:)
                                                userInfo:@"123"
                                                 repeats:YES];
    
    // NSDefaultRunLoopMode（默认）:同一时间只能执行一个任务
    // NSRunLoopCommonModes（公用）:可以分配一定的时间执行其他任务
    // 作用：修改timer在runloopz中的模式为NSRunLoopCommonModes
    // 目的：不管主线程在做什么操作，都会分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)stopTimer{
    [self.timer invalidate];
    self.timer = nil;
}
/*
 定时器滚动到下一页
 */
-(void)nextPage:(NSTimer *)timer{
    
    NSLog(@"userinfo ==== %@", timer.userInfo);
    
    // 1、计算下一页的页码
    NSInteger page = self.pageControl.currentPage + 1;
    // 2、超过了最后一页
    if (page == 5) {
        page = 0;
    }
    // 3、滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:true];
}

#pragma mark --------------------
#pragma mark - scrollview协议方法

/**
 用户即将开始拖拽scrollview的时候停止定时器

 @param scrollView scrollview对象
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}


/**
 用户已经停止拖拽

 @param scrollView scrollview对象
 @param decelerate 是否有弹性动画
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 四舍五入：int（小数 + 0.5）
    // 1、计算页码
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    // 2、设置页码
    self.pageControl.currentPage = index;
}

/*
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 1、计算页码
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 2、设置页码
    self.pageControl.currentPage = index;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerated{
    if (decelerated == false) {
        // 1、计算页码
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        // 2、设置页码
        self.pageControl.currentPage = index;
    }
}
*/

@end
