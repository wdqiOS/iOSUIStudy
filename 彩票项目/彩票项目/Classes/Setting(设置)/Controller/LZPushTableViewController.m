//
//  LZPushTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/28.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPushTableViewController.h"
#import "LZSettingArrowItem.h"
#import "LZScoreTableViewController.h"
#import "LZAwardTableViewController.h"

@interface LZPushTableViewController ()


@end

@implementation LZPushTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
}


// 第0组
-(void)setupGroup0{
    // 第0组
    // 创建行模型
    LZSettingArrowItem *item1 = [LZSettingArrowItem itemWithTitle:@"开奖推送"];
    item1.desVC = [LZAwardTableViewController class];
    LZSettingArrowItem *item2 = [LZSettingArrowItem itemWithTitle:@"比分直播"];
    item2.desVC = [LZScoreTableViewController class];
    LZSettingArrowItem *item3 = [LZSettingArrowItem itemWithTitle:@"中奖动画"];
    LZSettingArrowItem *item4 = [LZSettingArrowItem itemWithTitle:@"购彩大厅"];
    LZSettingGroup *group = [LZSettingGroup grougWithItems:@[item1,item2, item3, item4]];

    // 将行模型数组添加到组模型数组中
    [self.groups addObject:group];
}

-(void)dealloc{
    NSLog(@"%s  line = %d", __func__, __LINE__);
}




@end
