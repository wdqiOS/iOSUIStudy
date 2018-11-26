//
//  LZTableViewController.m
//  个人详情页
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTableViewController.h"

@interface LZTableViewController ()

/** 数据源 */
@property(nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *ID = @"cell";
@implementation LZTableViewController

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithObjects:@"1", @"2",@"3", @"4", @"5", @"6", @"7", @"8",@"9", @"10",@"11", @"12", @"13", @"14", @"15", @"16",@"17", @"18",@"19", @"20", @"21", @"22", @"23", @"24", nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    // 1. 凡是在导航条下面的scrollview，默认会设置偏移量.UIEdgeInsetsMake(64, 0, 0, 0)
//    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    // 不要自动设置偏移量
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    // 让导航条隐藏
//    self.navigationController.navigationBar.hidden = true;
    // 导航条或者是导航条上的控件设置透明度是没有效果的
//    self.navigationController.navigationBar.alpha = 0;
    // 设置导航条背景(必须要使用默认的模式UIBarMetricsDefault)
    // 当背景图片设置为nil，系统会自动生成一张半透明的图片，设置为导航条的背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // 设置tableview的headerView
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    headerV.backgroundColor = UIColor.redColor;
    self.tableView.tableHeaderView = headerV;
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 调用cell之前，必须先注册一个cell的nib或class
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//     Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [self.dataArray removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//}

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

@end
