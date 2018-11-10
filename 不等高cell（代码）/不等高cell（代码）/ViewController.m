//
//  ViewController.m
//  不等高cell（代码）
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension/MJExtension.h"
#import "LZStatus.h"
#import "LZStatusCell.h"

@interface ViewController ()

/** 所有的数据源 */
@property(nonatomic, strong) NSArray *statuses;

@end

@implementation ViewController

-(NSArray *)statuses{
    if (_statuses == nil) {
        _statuses = [LZStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}

static NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 注册cell
    [self.tableView registerClass:[LZStatusCell class] forCellReuseIdentifier:ID];
    
//    self.tableView.rowHeight = 200;
}


#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    LZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.statuses = self.statuses[indexPath.row];
    return cell;
}


#pragma mark --------------------
#pragma mark - 代理方法

// 方案：在这个方法返回之前，就要计算cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s --------- %zd", __func__, indexPath.row);
    LZStatus *statuses = self.statuses[indexPath.row];
    return statuses.cellHeight;
}

@end
