//
//  LZContactVC.m
//  纯代码实现通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZContactVC.h"
#import "LZAddContactVC.h"
#import "LZContactItem.h"
#import "LZEditVC.h"
#import "LZContactCell.h"

@interface LZContactVC ()<LZAddContactVCDelegate>

/** 存放联系人数组 */
@property(nonatomic, strong) NSMutableArray *dataArray;

@end
// cell复用标识
static NSString *cellID = @"cellID";

@implementation LZContactVC

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = [NSString stringWithFormat:@"%@的通讯录", self.accountName];
    // 左侧导航按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(loginOut)];
    // 右侧导航按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:0 target:self action:@selector(addClick)];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZContactCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable) name:@"reloadData" object:nil];
}

#pragma mark --------------------
#pragma mark - 监听刷新表格事件
-(void)reloadTable{
    [self.tableView reloadData];
}

#pragma mark --------------------
#pragma mark - 添加按钮点击事件
-(void)addClick{
    LZAddContactVC *addVC = [[LZAddContactVC alloc] init];
    addVC.delegate = self;
    [self.navigationController pushViewController:addVC animated:true];
}

#pragma mark --------------------
#pragma mark - LZAddContactVCDelegate
// 3. 实现协议方法
-(void)addContactVC:(LZAddContactVC *)addContactVC contactItem:(LZContactItem *)contactItem{
    NSLog(@"%@ ---- %@", contactItem.name, contactItem.phone);
    // 保存联系人数据
    [self.dataArray addObject:contactItem];
    
    // 刷新表格
    [self.tableView reloadData];
    // 去除多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark --------------------
#pragma mark - 导航栏左右按钮点击
// 退出登录
- (void)loginOut{
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定要退出登陆吗？" message:@"message" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //    [alert show];
    
    //    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定要退出登陆吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
    //    [actionSheet showInView:self.view];
    
    // 1.创建控制器
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要退出登录吗？" message:@"显示的信息" preferredStyle:UIAlertControllerStyleActionSheet];
    // 2.创建按钮
    UIAlertAction *cancelaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *okaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:true];
    }];
    
    // 3.添加按钮
    [alertController addAction:cancelaction];
    [alertController addAction:okaction];
    
    // 4.显示弹框
    [self presentViewController:alertController animated:true completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LZContactCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    LZContactItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LZContactItem *item = self.dataArray[indexPath.row];
    LZEditVC *editVC = [[LZEditVC alloc] init];
    editVC.contactItem = item;
    [self.navigationController pushViewController:editVC animated:true];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
