//
//  LZContactVC.m
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZContactVC.h"
#import "LZAddContactVC.h"
#import "LZContactItem.h"
#import "LZEditVC.h"

@interface LZContactVC ()<UIActionSheetDelegate, UIAlertViewDelegate,LZAddContactVCDelegate>

/** 存放联系人数组 */
@property(nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *ID = @"cellID";
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable) name:@"reloadData" object:nil];
}

#pragma mark --------------------
#pragma mark - 监听刷新表格事件
-(void)reloadTable{
    [self.tableView reloadData];
}

-(void)setItem:(LZContactItem *)item{
    _item = item;
    NSLog(@"%@ ---- %@", item.name, item.phone);
}

-(void)setAccountName:(NSString *)accountName{
    _accountName = accountName;
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录", accountName];
}

// storyboard页面跳转时会先调用该方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[LZAddContactVC class]]) {
        LZAddContactVC *addVC = (LZAddContactVC *)segue.destinationViewController;
        //    addVC.contactVC = self;
        // 1. 遵守协议
        // 2.设置代理
        addVC.delegate = self;
    }else{
        LZEditVC *editVC = (LZEditVC *)segue.destinationViewController;
        // 当前选中的行模型传递给编辑控制器
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LZContactItem *item = self.dataArray[indexPath.row];
        // 需要注意控制器的懒加载，不设置view的颜色的话，view没有使用到，没加载
//        editVC.view.backgroundColor = [UIColor redColor];
        editVC.contactItem = item;
        
   
        
//        [item addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial context:nil];
//        [item addObserver:self forKeyPath:@"phone" options:NSKeyValueObservingOptionInitial context:nil];
    }

}

//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"%s", __func__);
//    [self.tableView reloadData];
//}

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
- (IBAction)loginOut:(UIBarButtonItem *)sender {
    
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

//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == 1) {
//        // 退出
//        [self.navigationController popViewControllerAnimated:true];
//    }
//}
//
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if(buttonIndex == 0){
//        // 退出
//        [self.navigationController popViewControllerAnimated:true];
//    }
//}


#pragma mark - Table view data source

// 展示多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
    // 取出当前行模型
    LZContactItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.phone;
 
    return cell;
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc{
    NSLog(@"%s", __func__);
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
