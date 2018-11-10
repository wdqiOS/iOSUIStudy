//
//  ViewController.m
//  数据刷新
//
//  Created by 汪大强 on 2018/11/9.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZWineCell.h"
#import "LZTg.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

/** tg数据 */
@property(nonatomic, strong) NSMutableArray *tgArray;
// tableview
@property (weak, nonatomic) IBOutlet UITableView *tableview;
// 删除按钮
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
// 更新按钮
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;

/** 记录用户选中的索引 */
@property(nonatomic, strong) NSMutableArray *selectedIndexPaths;

@end

@implementation ViewController

-(NSMutableArray *)selectedIndexPaths{
    if (_selectedIndexPaths == nil) {
        _selectedIndexPaths = [NSMutableArray array];
    }
    return _selectedIndexPaths;
}

-(NSMutableArray *)tgArray{
    if (_tgArray == nil) {
        _tgArray = [LZTg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 编辑模式下可以多选
    self.tableview.allowsMultipleSelectionDuringEditing = true;
}

#pragma mark --------------------
#pragma mark - 监听按钮的点击
- (IBAction)add {
    // 修改模型
    LZTg *tg = [[LZTg alloc] init];
    tg.icon = @"2.jpg";
    tg.title = @"测试1111";
    tg.price = @"10000";
    [self.tgArray insertObject:tg atIndex:0];
    // 告诉tableview数据变了，刷新数据
//    [self.tableview reloadData];
    // 局部刷新
    NSArray *indexpaths = @[
                            [NSIndexPath indexPathForRow:0 inSection:0]
                            ];
    // 使用前提：保证数据不变
//    [self.tableview reloadRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationLeft];
    // 局部刷新得使用insertRowsAtIndexPaths
    [self.tableview insertRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)delete {
//    self.tableview.editing = !self.tableview.editing;
    [self.tableview setEditing:!self.tableview.editing animated:true];
    [self.deleteBtn setTitle:(self.tableview.editing == true) ? @"放弃删除" : @"删除" forState: UIControlStateNormal];
    [self.updateBtn setTitle:((self.tableview.editing == true) ? @"全部删除" : @"更新") forState:UIControlStateNormal];
//   // 1. 修改模型
//    [self.tgArray removeObjectAtIndex:0];
//    [self.tgArray removeObjectAtIndex:1];
//
//    // 2. 刷新表格
////    [self.tableview reloadData];
//
//    NSArray *indexpaths = @[
//                            [NSIndexPath indexPathForRow:0 inSection:0],
//                            [NSIndexPath indexPathForRow:1 inSection:0]
//                            ];
//    // 使用前提：保证数据不变
//    //    [self.tableview reloadRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationLeft];
//    [self.tableview deleteRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)update {
    
    if ([self.updateBtn.titleLabel.text isEqualToString:@"全部删除"]) {
        // 千万不要一边遍历一边删除，因为每删除一个元素，其他元素的索引可能会发生变化
        NSMutableArray *deletedTgs = [NSMutableArray array];
        for (NSIndexPath *indexPath in self.tableview.indexPathsForSelectedRows) {
            [deletedTgs addObject:self.tgArray[indexPath.row]];
        }
        // 修改模型
        [self.tgArray removeObjectsInArray:deletedTgs];
        // 刷新表格
        [self.tableview deleteRowsAtIndexPaths:self.tableview.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    if ([self.updateBtn.titleLabel.text isEqualToString:@"自定义删除"]) {
        NSMutableArray *deletedTgs = [NSMutableArray array];
        for (NSIndexPath *indexPath in self.selectedIndexPaths) {
            [deletedTgs addObject:self.tgArray[indexPath.row]];
        }
        // 修改模型
        [self.tgArray removeObjectsInArray:deletedTgs];
        // 刷新表格
        [self.tableview deleteRowsAtIndexPaths:self.selectedIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        
        // 清空数组
        [self.selectedIndexPaths removeAllObjects];
        [self.updateBtn setTitle:@"更新" forState:UIControlStateNormal];
        
        
        return;
    }
    
    
    // 1. 拿到模型
    LZTg *tg = [self.tgArray objectAtIndex:0];
    tg.title = @"更新数据";
    tg.price = @"111111111";
    
    LZTg *tg2 = [self.tgArray objectAtIndex:1];
    tg2.title = @"哈哈";
    
    // 2. 刷新数据
    // 全局刷新
//    [self.tableview reloadData];
    
    // 局部刷新
    NSArray *indexpaths = @[
                            [NSIndexPath indexPathForRow:0 inSection:0],
                            [NSIndexPath indexPathForRow:1 inSection:0]
                            ];
//    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableview reloadRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark --------------------
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"wine";
    LZWineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[LZWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.imageView.frame = CGRectMake(0, 0, 50, 50);
    }
    cell.tg = self.tgArray[indexPath.row];
    
    return cell;
}

#pragma mark --------------------
#pragma mark - UITableViewDelegate

/**
 设置自定义删除按钮在右侧

 @param tableView tableview对象
 @param indexPath indexPath
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LZTg *tg = self.tgArray[indexPath.row];
//    tg.checked = !tg.checked;
    
    if (tg.isChecked) { // 之前是打钩的，取消打钩
        tg.checked = NO;
        [self.selectedIndexPaths removeObject:indexPath];
    }else{ // 之前不是打钩的，选中打钩
        tg.checked = YES;
        [self.selectedIndexPaths addObject:indexPath];
    }
    
    [self.updateBtn setTitle:(self.selectedIndexPaths.count > 0 ? @"自定义删除" : @"更新") forState:UIControlStateNormal];
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    
}

/**
 只要实现这个方法，就拥有左滑删除功能 系统默认的删除
 点击左滑出现的Dele按钮，会调用这个方法
 @param tableView tableview对象
 @param editingStyle 动画
 @param indexPath indexPath
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s", __func__);
    // 1. 获取模型
    [self.tgArray removeObjectAtIndex:indexPath.row];
    [self.tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
// 左侧删除按钮文字
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}


/**
 左滑出现什么按钮

 @param tableView tableview对象
 @param indexPath indexPath
 @return 展示的按钮
 */
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    self.tableview.editing = YES;

    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"关注");
        [self.tableview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
//        self.tableview.editing = NO;
    }];
    action.backgroundColor = UIColor.lightGrayColor;
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
        // 1. 获取模型
        [self.tgArray removeObjectAtIndex:indexPath.row];
        [self.tableview deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    action1.backgroundColor = UIColor.redColor;
    
    return @[action1,action];
}



@end
