//
//  ViewController.m
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/26.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZViewController.h"
// 自定义view
#import "LZShopView.h"
#import "LZShop.h"
// 自定义商品xib
#import "LZShopViewXib.h"
/** 自定义商品按钮 */
#import "LZShopviewBtn.h"
@interface LZViewController ()
// 购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;

// 添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;

// 删除按钮
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

// 数据数组
@property(nonatomic, strong) NSArray *dataArr;

/** 提示文字
 */
@property (weak, nonatomic) IBOutlet UILabel *showHUB;

@end

@implementation LZViewController


/**
 懒加载
 1、作用：
    1> 用到的时候再加载
    2> 全局只会被加载一次
    3> 全局都可以使用
 
 2、过程
    1> 重写成员变量的getter方法
    2> 在getter方法中判断；
        1> 如果为空，加载数据
        2> 不为空，则直接返回数据
 @return 数据源
 */
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        // 加载数据
        // 1. 获取全路径
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        // 字典转模型
        // 创建临时数组
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dict in self.dataArr) {
            // 创建LZShop对象
            LZShop *shop = [LZShop shopWithDict:dict];
            [tmpArray addObject:shop];
        }
        self.dataArr = tmpArray;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


/**
 添加到购物车

 @param sender 按钮
 */
- (IBAction)add:(UIButton *)sender {

/******************** 1.定义一些常量 *********************************/
    // 1. 总列数
    NSInteger allCols = 3;
    // 2. 商品的宽度
    CGFloat width = 80;
    CGFloat height = 100;
    // 3. 求出水平间距 和 垂直间距
    CGFloat hMargin = (self.shopCarView.frame.size.width - allCols * width) / (allCols - 1);
    CGFloat vMargin = (self.shopCarView.frame.size.height - 2 * height) / 1;
    // 4. 设置索引
    NSInteger index = [self.shopCarView.subviews count];
    // 4.求出x值
    CGFloat x = (hMargin + width) * (index % allCols);
    CGFloat y = (vMargin + height) * (index / allCols);
    

/******************** 2.创建一个商品 *********************************/
    /*
    // 1.创建商品view
    UIView *shopView = [[UIView alloc] init];
    
    // 2.设置frame
    shopView.frame = CGRectMake(x, y, width, height);
    
    // 3.设置背景颜色
    shopView.backgroundColor = UIColor.greenColor;
    
    // 4.添加到购物车
    [self.shopCarView addSubview:shopView];
    
    // 5. 创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(0, 0, width, width);
    iconView.backgroundColor = UIColor.blueColor;
    [shopView addSubview:iconView];
    
    // 6. 创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, width, width, height - width);
    titleLabel.backgroundColor = UIColor.yellowColor;
    titleLabel.textAlignment = NSTextAlignmentCenter; // 居中
    [shopView addSubview:titleLabel];
    */
    /* 创建方式一
    LZShop *shop = self.dataArr[index];
    LZShopView *shopView = [[LZShopView alloc] init];
    shopView.frame = CGRectMake(x, y, width, height);
    // 设置数据
    shopView.shop = shop;
    [self.shopCarView addSubview:shopView];
    */
    
    // 纯代码创建
//    LZShop *shop = self.dataArr[index];
//    LZShopView *shopView = [[LZShopView alloc] initWithShop:shop];
//    shopView.frame = CGRectMake(x, y, width, height);
//    [self.shopCarView addSubview:shopView];
    
    
    // 使用xib创建
    /*
    LZShop *shop = self.dataArr[index];
    LZShopViewXib *shopView = [LZShopViewXib shopView];
    shopView.frame = CGRectMake(x, y, width, height);
    shopView.shop = shop;
    [self.shopCarView addSubview:shopView];
    */
    // 使用自定义按钮
    LZShop *shop = self.dataArr[index];
    LZShopviewBtn *shopView = [[LZShopviewBtn alloc] init];
    shopView.frame = CGRectMake(x, y, width, height);
    shopView.shop = shop;
    [self.shopCarView addSubview:shopView];
    
/******************** 3.设置数据 *********************************/
    // 数值数据
    /**
    // 方式一：（不可取:数据都是一样）
    iconView.image = [UIImage imageNamed:@"danjianbao"];
    titleLabel.text = @"单肩包";
    */
    
    // 方式二：（不可取：太冗余）
    /*
    if(index == 0){
        iconView.image = [UIImage imageNamed:@"danjianbao"];
        titleLabel.text = @"单肩包";
    } else if(index == 1){
        iconView.image = [UIImage imageNamed:@"qianbao"];
        titleLabel.text = @"钱包";
    }
    */
    
    // 方式三：（数组:两个数组之间没有任何联系，容易出错）
    /*
    NSArray<NSString *> *imageNames = @[@"danjianbao", @"qianbao", @"liantiaobao", @"shoutibao",@"shuangjianbao", @"xiekuabao"];
    NSArray<NSString *> *titleNames = @[@"单肩包",@"钱包", @"链条包", @"手提包", @"双肩包", @"斜挎包"];
    iconView.image = [UIImage imageNamed:imageNames[index]];
    titleLabel.text = titleNames[index];
    */
    // 方式四：（数组+字典）
    // 设置数据
//    NSDictionary *dict = self.dataArr[index];
//    iconView.image = [UIImage imageNamed:dict[@"icon"]];
//    titleLabel.text = dict[@"name"];
    
   
//    iconView.image = [UIImage imageNamed:LZShop.icon];
//    titleLabel.text = LZShop.name;
    
//    [shopView setIcon:shop.icon];
//    [shopView setName:shop.name];
    
    
    
/******************** 4.设置按钮的状态 *********************************/
    sender.enabled = (index != 5);
    
    // 5. 设置删除按钮的状态
    self.removeButton.enabled = true;
    
/******************** 5.设置HUB的状态 *********************************/
    if (index == 5) {
//        [UIView animateWithDuration:2.0 animations:^{
//            self.showHUB.text = @"当前购物车已空，赶紧买买买~";
//           // 执行动画
//            self.showHUB.alpha = 1.f;
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:1.0 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
//                self.showHUB.alpha = 0;
//            } completion:nil];
//        }];
        [self showWithInfo:@"当前购物车已满，不要买买买~"];
    }
}


/**
 从购物车删除

 @param sender 按钮
 */
- (IBAction)remove:(UIButton *)sender {
    
    
    // 1. 删除最后一个商品
    UIView *lastView = [self.shopCarView.subviews lastObject];
    [lastView removeFromSuperview];
    
    // 2、 设置添加按钮的状态
    self.addButton.enabled = true;
    
    // 3、设置删除按钮的状态
    sender.enabled = (self.shopCarView.subviews.count != 0);
    
    // 4. 设置HUB的状态
    if (self.shopCarView.subviews.count == 0) {
        [self showWithInfo:@"当前购物车已空，赶紧买买买~"];
    }

}

-(void)showWithInfo:(NSString *)info{
    [UIView animateWithDuration:2.0 animations:^{
        self.showHUB.text = info;
        // 执行动画
        self.showHUB.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
            self.showHUB.alpha = 0;
        } completion:nil];
    }];
}


@end
