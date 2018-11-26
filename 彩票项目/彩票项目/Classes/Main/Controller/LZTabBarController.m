//
//  LZTabBarController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTabBarController.h"
#import "LZHallTableViewController.h"
#import "LZArenaViewController.h"
#import "LZDiscoverTableViewController.h"
#import "LZHistoryTableViewController.h"
#import "LZMyLotteryViewController.h"
#import "LZTabBar.h"
#import "LZNavigationViewController.h"
#import "LZArenaNavViewController.h"

@interface LZTabBarController ()<LZTabBarDelegate>

/** tabBar item 模型数组 */
@property(nonatomic, strong) NSMutableArray *items;

@end

@implementation LZTabBarController

// 懒加载保存tabBar item数组
-(NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 1.添加子控制器
    [self setupAllChildViewController];
    
    // 2. 自定义tabBar
    [self setupTabBar];

}

#pragma mark --------------------
#pragma mark - 自定义tabBar
-(void)setupTabBar{
   
    /*
    1. 移除系统tabBar（简单粗暴）
     思路：
     1、tabBar 采用 UIView
     2、tabBar子控件采用 UIButton
     3、切换子控制器 使用selectIndex
     */
    // 1. 移除系统的tabbar
    [self.tabBar removeFromSuperview];
    CGFloat tabBarX = self.tabBar.frame.origin.x;
    CGFloat tabBarY = self.tabBar.frame.origin.y;
    CGFloat tabBarW = self.tabBar.frame.size.width;
    CGFloat tabBarH = self.tabBar.frame.size.height;
    if ([UIApplication sharedApplication].statusBarFrame.size.height > 20) {
        tabBarY -= 30;
        tabBarH += 30;
    }
    // 2. 添加自定义的tabbar
    LZTabBar *tabBar = [[LZTabBar alloc] initWithFrame:CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH)];
    // 子控制器的个数
//    tabBar.count = self.viewControllers.count;
    tabBar.items = self.items;
    [self.view addSubview:tabBar];
//    tabBar.frame = self.tabBar.frame;
    tabBar.delegate = self;
    tabBar.backgroundColor = [UIColor purpleColor];
    
    // 2. UIButton内容
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
//    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
//        if ([obj isKindOfClass:[UIControl class]]) {
//            [obj removeFromSuperview];
//        }
//    }];
    // 移除系统的tabbar
    [self.tabBar removeFromSuperview];
}

#pragma mark --------------------
#pragma mark - LZTabBarDelegate协议方法
-(void)tabBar:(LZTabBar *)tabBar index:(NSInteger)index{
    // 切换控制器
    self.selectedIndex = index;
}

#pragma mark --------------------
#pragma mark - 添加所有的子控制器
-(void)setupAllChildViewController{
    // 尺寸不合适
    // 1、找UI妹子，调整图片，项目负责人（PM）
    // 2、自定义
    // 1. 移除（简单粗暴）
    /*
     思路：
        1、tabBar 采用 UIView
        2、tabBar子控件采用 UIButton
        3、切换子控制器 使用selectIndex
     */
     
    // 2. 移除tabbar子控件
    
    // tabBarItem 模型，对应子控制器的tabBarItem决定
    // 1. 购彩大厅
    LZHallTableViewController *hall = [[LZHallTableViewController alloc] init];
    [self setupOneChilidController:hall
                             image:[UIImage imageNamed:@"TabBar_LotteryHall_new"]
                       selectImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 2. 竞技场
    LZArenaViewController *arena = [[LZArenaViewController alloc] init];
    [self setupOneChilidController:arena
                             image:[UIImage imageNamed:@"TabBar_Arena_new"]
                       selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    // 3. 发现
    LZDiscoverTableViewController *discover = [[LZDiscoverTableViewController alloc] init];
    [self setupOneChilidController:discover
                             image:[UIImage imageNamed:@"TabBar_Discovery_new"]
                       selectImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];

    // 4. 开奖信息
    LZHistoryTableViewController *history = [[LZHistoryTableViewController alloc] init];
    [self setupOneChilidController:history
                             image:[UIImage imageNamed:@"TabBar_History_new"]
                       selectImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    // 5. 我的彩票
    LZMyLotteryViewController *myLottery = [[LZMyLotteryViewController alloc] init];
    [self setupOneChilidController:myLottery
                             image:[UIImage imageNamed:@"TabBar_MyLottery_new"]
                       selectImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
    
    
}

// 添加一个控制器
-(void)setupOneChilidController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    
    // 包装成导航控制器
    // 1. 创建导航控制器
    UINavigationController *nav = [[LZNavigationViewController alloc] initWithRootViewController:vc
                                   ];
    if([vc isKindOfClass:[LZArenaViewController class]]){
        nav = [[LZArenaNavViewController alloc] initWithRootViewController:vc];
    }
    
    [self addChildViewController:nav];
    
    // 导航控制器上的内容由栈顶控制器navItem
    vc.navigationItem.title = title;
    
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    
    [self.items addObject:vc.tabBarItem];
    
}



@end
