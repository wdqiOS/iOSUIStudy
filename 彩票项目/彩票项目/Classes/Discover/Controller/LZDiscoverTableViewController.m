//
//  LZDiscoverTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDiscoverTableViewController.h"

@interface LZDiscoverTableViewController ()

@end

@implementation LZDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 刷新tableview
    [self.tableView reloadData];
}

// 当cell将要显示的时候调用
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    // 当cell将要显示的时候做动画从右向左动画
   
    // 1. 将cell平移到屏幕外
    cell.transform = CGAffineTransformMakeTranslation(cell.width, 0);
    // 2. 让cell复位
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

@end
