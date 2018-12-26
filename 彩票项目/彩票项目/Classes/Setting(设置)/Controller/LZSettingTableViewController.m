//
//  LZSettingTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZSettingTableViewController.h"
#import "LZPushTableViewController.h"


@interface LZSettingTableViewController ()


@end

@implementation LZSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"设置";
    self.navigationItem.title = @"设置";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    
   
}

// 第0组
-(void)setupGroup0{
    // 第0组
    // 创建行模型
    NSMutableArray *items1 = [NSMutableArray array];
    LZSettingArrowItem *item = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    item.desVC = [UIViewController class];
   
//    item.type = LZSettingItemRightViewStateArrow;
    [items1 addObject:item];
    LZSettingGroup *group = [LZSettingGroup grougWithItems:items1];
    group.headerTitle = @"0000";
    group.footerTitle = @"11111";
    // 将行模型数组添加到组模型数组中
    [self.groups addObject:group];
}

-(void)dealloc{
    NSLog(@"%s  line = %d", __func__, __LINE__);
}

// 第1组
-(void)setupGroup1{
    // 第1组
    // 创建行模型
    LZSettingArrowItem *item1 = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"推送提醒"];
//    item1.desVC = [LZPushTableViewController class];
    NSString *title = item1.title;
    // block 防止循环引用
    // 你拥有我，我引用你
    // block 会对代码块里面的强指针强引用
//    __strong
    // 方法一：
//    __weak LZSettingTableViewController *weakSelf = self;
    // 方法二：
    // typeof(x) 动态根据x判断x的真实类型
//    int a = 10;
//    typeof(1) b = 10;
//    NSLog(@"a %d b %d", a, b);
    __weak typeof(self) weakSelf = self;
    item1.operationBlock = ^(NSIndexPath *indexPath){
        UIViewController *vc = [[LZPushTableViewController alloc] init];
        vc.title = title;
        [weakSelf.navigationController pushViewController:vc animated:true];
        // 在block中如果访问下划线的成员属性，会造成循环引用
//        NSLog(@"%@", _groups);
    };
    
    LZSettingSwitchItem *item2 = [LZSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    item2.on = true;
    LZSettingSwitchItem *item3 = [LZSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    item3.on = true;
    LZSettingItem *item4 = [LZSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    NSArray *items2 = @[item1, item2, item3, item4];
    // 将行模型数组添加到组模型数组中
    LZSettingGroup *group = [LZSettingGroup grougWithItems:items2];
    group.headerTitle = @"2222";
    group.footerTitle = @"33333";
    // 将行模型数组添加到组模型数组中
    [self.groups addObject:group];
}
// 第2组
-(void)setupGroup2{
    // 第2组
    // 创建行模型
    LZSettingItem *item1 = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"检查版本更新"];
    item1.operationBlock = ^(NSIndexPath *indexPath){
        // 弹框
        [MBProgressHUD wj_showSuccess:@"没有版本更新"];
    };
    LZSettingItem *item2 = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    item2.operationBlock = ^(NSIndexPath *indexPath){
        // 弹框
        [MBProgressHUD wj_showSuccess:@"没有版本更新"];
    };
    LZSettingItem *item3 = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    LZSettingItem *item4 = [LZSettingArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    NSArray *items2 = @[item1, item2, item3, item4];
    // 将行模型数组添加到组模型数组中
    LZSettingGroup *group = [LZSettingGroup grougWithItems:items2];
    group.headerTitle = @"4444";
    group.footerTitle = @"5555";
    // 将行模型数组添加到组模型数组中
    [self.groups addObject:group];
}


@end
