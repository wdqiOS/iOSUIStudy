//
//  ViewController.m
//  UITableView的性能优化
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString *ID = @"wine";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 隐藏多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.rowHeight = 100;
    
    // 根据ID 这个标识 注册对应的cell类型 为UITableviewcell  必须写在dequeueReusableCellWithIdentifier之前，只注册一次就可以
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}


#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}


/**
 每当一个cell进入视野范围内就会调用一次

 @param tableView tableview对象
 @param indexPath indexPath对象
 @return 创建的cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.静态局部变量：修改了生命周期，不修改作用域（作用域：{} 全局只创建一份）
//    static NSString *ID = @"wine";
    
    // 根据ID 这个标识 注册对应的cell类型 为UITableviewcell  必须写在dequeueReusableCellWithIdentifier之前，只注册一次就可以
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    // 1.去缓存池取是否有可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    /*
    // 2.如果缓存池中没有可循环利用的cell，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
     */
    // 3. 设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行", indexPath.row];
    
    // 4. 设置右侧样式
    if(indexPath.row % 2 == 0){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

@end
