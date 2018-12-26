//
//  LZBaseTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/28.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZBaseTableViewController.h"


@interface LZBaseTableViewController ()


@end

@implementation LZBaseTableViewController

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(NSMutableArray *)groups{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 1. 取出组模型
    LZSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1. 创建cell
    LZSettingTableViewCell *cell = [LZSettingTableViewCell cellWithTableView:tableView];
    
    // 取出组模型
    LZSettingGroup *group = self.groups[indexPath.section];
    // 1. 取出行模型
    LZSettingItem *item = group.items[indexPath.row];
    // 2. 设置数据
    cell.item = item;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.groups[section] headerTitle];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [self.groups[section] footerTitle];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 点击跳转
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    // 点击检查版本更新弹窗
    // block
    //    if (indexPath.section == 2 && indexPath.row == 0) {
    //        // 第2组，第0行
    //        // 弹框
    //        [MBProgressHUD wj_showSuccess:@"没有版本更新"];
    //        return;
    //    }
    
    // 1. 取出组模型
    LZSettingGroup *group = self.groups[indexPath.section];
    // 2. 取出行模型
    LZSettingItem *item = group.items[indexPath.row];
    
    // 做事情和跳转只能做一件
    if (item.operationBlock) {
        item.operationBlock(indexPath);
        
        return;
    }
    
    // 只有箭头模型才具备跳转
    if ([item isKindOfClass:[LZSettingArrowItem class]]) {
        // 跳转
        LZSettingArrowItem *arrorwItem = (LZSettingArrowItem *)item;
        if (arrorwItem.desVC) { // 如果有目标控制器才跳转
            UIViewController *vc = [[arrorwItem.desVC alloc] init];
            vc.navigationItem.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
}


@end
