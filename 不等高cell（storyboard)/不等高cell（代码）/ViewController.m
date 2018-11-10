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
    // 注册cell storyboard不用注册
//    [self.tableView registerClass:[LZStatusCell class] forCellReuseIdentifier:ID];
    
    // self-sizing(iOS8 以后才)
    // 告诉tableview所有cell的真实高度是自动计算的（根据设置的约束自动计算）
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // 设置估算高度 作用：减少heightForRowAtIndexPath的调用次数
    self.tableView.estimatedRowHeight = 200;
}


#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.statuses = self.statuses[indexPath.row];
    return cell;
}


#pragma mark --------------------
#pragma mark - 代理方法
// 方案：在这个方法返回之前，就要计算cell的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%s --------- %zd", __func__, indexPath.row);
//    LZStatus *statuses = self.statuses[indexPath.row];
//    return statuses.cellHeight;
//}

// 使用自动布局兼容iOS8.0 以前
// LZStatusCell *cell;
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 因为预估高度是iOS8.0之后才支持，为了兼容iOS8.0以前必须自己计算cell高度
//    // 创建一个临时的cell（目的：传递idexPath对应这行的模型，布局内部所有的子控件，得到cell的高度）
//     if(cell == nil){
//        cell = [tableView dequeueReusableCellWithIdentifier:ID];
//     }
//    cell.statuses = self.statuses[indexPath.row];
//    return cell.cellHeight;
//}

// 每一行的估算高度
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44;
//}

@end
