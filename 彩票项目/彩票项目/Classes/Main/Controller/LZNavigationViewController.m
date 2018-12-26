//
//  LZNavigationViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZNavigationViewController.h"
#import <objc/runtime.h>

@interface LZNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

/** 系统手势代理 */
@property(nonatomic, strong) id popDelegate;

@end

@implementation LZNavigationViewController

// 什么时候调用？当第一次初始化这个类的时候调用，如果当这个类有子类会调用多次
// 作用：初始化这个类(先初始化父类，再初始化子类)
+(void)initialize{
//   NSLog(@"%s", __func__);
    
    // 1. 获取导航条标识
    // 获取APP的导航条标识
    // appearance 是一个协议，只要遵守了这个协议，都有这个方法
    // [UINavigationBar appearance];如果这样写，有重大bug，全程序的导航条都统一样式
    // appearanceWhenContainedIn: 获取几个类的导航条标识
    // 只获取LZNavigationViewController类的标识
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[LZNavigationViewController class], nil];

    // 设置背景
    // UIBarMetricsDefault 设置背景图片只能用UIBarMetricsDefault模式 控制器viewcontroller的view尺寸{{0,64}, {375, 667}}
    // UIBarMetricsCompact 控制器view的尺寸{{0,0},{375, 667}}
    // 只要给导航设置背景图片只能用默认模式，但是控制器的view的尺寸是从64开始，高度 = 屏幕的高度 - 64
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // 设置字体颜色大小
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 设置导航条前景色(项目开发中不建议采用)
    /*
    [bar setTintColor:[UIColor redColor]];
    // UIBarButtonItem 获取导航条按钮的标记
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    // 修改返回按钮标题的位置
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
     */
}

// 什么时候调用？当程序一启动的时候就会调用
// 作用：将当前类加载进内存，放在代码区
// 比main先调用，自动释放池还没创建，需要自己控制内存
//+(void)load{
//    NSLog(@"%s", __func__);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self isKindOfClass: [LZNavigationViewController class]]) {
        // 当前类
        // 统一设置返回按钮、滑动移除控制器
        // 清空手势代理就能实现滑动返回，iOS6不支持
        //    self.interactivePopGestureRecognizer.delegate = nil;
        self.popDelegate = self.interactivePopGestureRecognizer.delegate;
        
        // 当是根控制器，就还原代理,如果是非根控制器，清空代理
        self.delegate = self;
        
        // 全屏滑动移除控制器
        // 1. 先修改系统的手势 UIScreenEdgePanGestureRecognizer，系统没有提供属性
        /*
         <UIScreenEdgePanGestureRecognizer: 0x7f935b51f9a0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f935b51d360>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition
         */
        UIScreenEdgePanGestureRecognizer *gest = (UIScreenEdgePanGestureRecognizer *)self.interactivePopGestureRecognizer;
        NSLog(@"--------------%@", gest);
        
        
        // 缺target 系统的私有属性
        // 不知道 target 的真实类型
        // oc runtime 机制 只能动态获取当前类的成员属性,但是不能获取其子类或者父类的属性
        // __unsafe_unretained cls 获取哪个类的成员属性
        // unsigned int * _Nullable outCount 获取Class 下面的所有成员属性的个数
        /*
         unsigned int outCount = 0;
         Ivar *var = class_copyIvarList([UIGestureRecognizer class], &outCount);
         for (int i = 0; i < outCount; i++) {
         //         var[i];
         // 获取成员属性的名字
         NSString *name = @(ivar_getName(var[i]));
         NSLog(@"name === %@", name);
         }
         */
        // 方法一： KVC 获取私有属性
        //    NSArray *targets = [gest valueForKeyPath:@"_targets"];
        //    NSLog(@"value === %@", targets);
        //    id target = [targets[0] valueForKeyPath:@"_target"];
        
        // 方法二：
        //    UIPanGestureRecognizer *pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan)];
        //    [self.view addGestureRecognizer:pan1];
        //    pan1.delegate = self;
        
        id target = self.interactivePopGestureRecognizer.delegate;
        
        
        // 2. 自己添加手势
        // 禁止系统的手势
        self.interactivePopGestureRecognizer.enabled = NO;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
        [self.view addGestureRecognizer:pan];
        pan.delegate = self;
    }
    
   
}

#pragma mark --------------------
#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count > 1;
}



// 重写系统的push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 放到push之前调用
    if (self.viewControllers.count > 0) { // 表示非根控制器
        viewController.hidesBottomBarWhenPushed = true;
    }
    
    [super pushViewController:viewController animated:animated];
    
   // 当非根控制器设置导航条左侧返回按钮
    if (self.viewControllers.count > 1) {
        // 根控制器
        // 设置导航条左侧返回按钮
        // 如果在导航控制器统一设置返回安妮，就没有滑动清除控制器的功能
        viewController.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
    }
    
 
    
    
}

-(void)back{
    [self popViewControllerAnimated:true];
}

#pragma mark --------------------
#pragma mark - UINavigationControllerDelegate
// 当控制器显示完毕的时候调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers[0] == viewController) {
        // 还原代理
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else{ // 非根控制器清空代理
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

@end
