//
//  LZScoreTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/28.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZScoreTableViewController.h"

@interface LZScoreTableViewController ()

@end

@implementation LZScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGrop0];
    [self setupGrop1];
    [self setupGrop2];
    [self setupGrop2];
    [self setupGrop2];
}

// 第0组
-(void)setupGrop0{
    LZSettingSwitchItem *item = [LZSettingSwitchItem itemWithTitle:@"关注比赛"];
    LZSettingGroup *group = [LZSettingGroup grougWithItems:@[item]];
    [self.groups addObject:group];
}

// 第1组
-(void)setupGrop1{
    LZSettingItem *item = [LZSettingItem itemWithTitle:@"起止时间"];
    item.subTitle = @"00:00";
    LZSettingGroup *group = [LZSettingGroup grougWithItems:@[item]];
    [self.groups addObject:group];
    
}

// 2组
-(void)setupGrop2{
    LZSettingItem *item = [LZSettingItem itemWithTitle:@"结束时间"];
    // 在iOS7以后只要把textfield添加到cell上，键盘处理操作系统帮我们做好了
//    __weak typeof(self) weakSelf = self;
    __unsafe_unretained typeof(self) weakSelf = self;
    item.operationBlock = ^(NSIndexPath *indexPath){
        
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        UITextField *textField = [[UITextField alloc] init];
        [cell addSubview:textField];
        [textField becomeFirstResponder];
    };
    LZSettingGroup *group = [LZSettingGroup grougWithItems:@[item]];
    item.subTitle = @"23:59";
    [self.groups addObject:group];
}


// 当scrollview开始滑动的时候调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.view endEditing:true];
}

@end
