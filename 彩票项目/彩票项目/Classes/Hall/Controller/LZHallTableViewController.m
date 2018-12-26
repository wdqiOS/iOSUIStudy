//
//  LZHallTableViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//


#import "LZHallTableViewController.h"
#import "LZCover.h"
#import "LZPopMenu.h"

@interface LZHallTableViewController ()<LZPopMenuDelegate>

@end

@implementation LZHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 设置导航条左侧按钮
//    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonOnClick)];
}

#pragma mark --------------------
#pragma mark - 左侧按钮点击事件
-(void)leftButtonOnClick{
    // 由谁添加由谁移除
    
    // 1. 弹出蒙版，占据整个屏幕，不允许与用户交互
    [LZCover show];
    // 2. popMenu
    /*
     1. 添加到蒙版上，耦合度太高，不宜采用
     2. 添加到窗口上
     */
    // 添加popView
    LZPopMenu *popMenu = [LZPopMenu showIncenter:self.view.center];
    popMenu.delegate = self;
    
//    CGFloat w = popMenu.width;
//    NSLog(@"wwww === %f", w);

}

#pragma mark --------------------
#pragma mark - LZPopMenuDelegate
-(void)popMenuDidCloseBtn:(LZPopMenu *)popMenu{
    NSLog(@"%s", __func__);
    
    void(^completion)(void) = ^(){
        // 移除蒙版
        [LZCover hide];
    };
    
    // 隐藏popMenu
    [popMenu hideInCenter:CGPointMake(44, 44) completion:completion];
    
    // 移除蒙版
    // 当动画执行完毕的时候移除蒙版
//    [LZCover hide];
    // block 可以保存一段代码，需要的时候调用
}

// 动画完成
-(void)popMenuCloseAnimationDone:(LZPopMenu *)popMenu{
    // 移除蒙版
    [LZCover hide];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"-----%@", NSStringFromCGRect(self.view.frame));
}

@end
