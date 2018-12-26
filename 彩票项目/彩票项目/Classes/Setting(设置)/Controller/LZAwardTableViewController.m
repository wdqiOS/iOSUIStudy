//
//  LZAwardTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/29.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZAwardTableViewController.h"

@interface LZAwardTableViewController ()

@end

@implementation LZAwardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
}

-(void)setupGroup0{
    LZSettingSwitchItem *item = [LZSettingSwitchItem itemWithTitle:@"双色球"];
    item.subTitle = @"每天开奖";
    LZSettingSwitchItem *item1 = [LZSettingSwitchItem itemWithTitle:@"双色球"];
    item1.subTitle = @"每天开奖";
    LZSettingSwitchItem *item2 = [LZSettingSwitchItem itemWithTitle:@"双色球"];
    item2.subTitle = @"每天开奖";
    LZSettingSwitchItem *item3 = [LZSettingSwitchItem itemWithTitle:@"双色球"];
    item3.subTitle = @"每天开奖";
    
    LZSettingGroup *group = [LZSettingGroup grougWithItems:@[item, item1, item2, item3]];
    
    [self.groups addObject:group];
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *ID = @"cell";
    // 1. 创建cell
//    LZSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[LZSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
    LZSettingTableViewCell *cell = [LZSettingTableViewCell cellWithTableView:tableView cellStyle:UITableViewCellStyleSubtitle];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    // 取出组模型
    LZSettingGroup *group = self.groups[indexPath.section];
    // 1. 取出行模型
    LZSettingItem *item = group.items[indexPath.row];
    // 2. 设置数据
    cell.item = item;
    return cell;
}

@end
