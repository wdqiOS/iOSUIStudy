//
//  LZAddContactVC.m
//  纯代码实现通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZAddContactVC.h"
#import "LZContactItem.h"

@interface LZAddContactVC ()

/** 姓名输入框 */
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
/** 电话输入框 */
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
/** 添加按钮 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation LZAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 使用添加事件监听
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

#pragma mark --------------------
#pragma mark - 文本框事件监听
// 当文本框内容发生改变时调用
-(void)textChange{
    self.addBtn.enabled = (self.nameTextF.text.length && self.phoneTextF.text.length);
}

#pragma mark --------------------
#pragma mark - 添加按钮点击事件
// 传递数据（逆传数据）
// 1. 数据接收的控制器定义一个属性来接收数据。
// 2. 数据的来源控制器要拿到数据接收的控制器。
// 3. 给接收的控制器的接收数据的属性赋值。
- (IBAction)addButtonClick:(UIButton *)sender {
    NSLog(@"%s", __func__);
    // 把输入的姓名和电话号码传递到上一控制器
    // 把输入的姓名和电话封装成一个模型
//    
    LZContactItem *item = [LZContactItem itemWithName:self.nameTextF.text phone:self.phoneTextF.text];
    //    self.contactVC.item = item;
    // 判断代理是否实现协议方法
    if ([self.delegate respondsToSelector:@selector(addContactVC:contactItem:)]) {
        [self.delegate addContactVC:self contactItem:item];
    }
    
    // 返回上一级
    [self.navigationController popViewControllerAnimated:true];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
