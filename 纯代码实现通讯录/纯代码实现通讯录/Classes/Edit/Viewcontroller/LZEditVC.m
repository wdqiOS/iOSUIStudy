//
//  LZEditVC.m
//  纯代码实现通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZEditVC.h"
#import "LZContactItem.h"

@interface LZEditVC ()

/** 姓名输入框 */
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
/** 电话输入框 */
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
/** 保存按钮 */
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation LZEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.nameTextF.text = self.contactItem.name;
    self.phoneTextF.text = self.contactItem.phone;
    
    // 导航栏标题
    self.navigationItem.title = self.contactItem.name;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:0 target:self action:@selector(editButtonClick:)];
}


#pragma mark --------------------
#pragma mark - 编辑按钮点击事件
- (void)editButtonClick:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"编辑"]) {
        // 电话文本框成为第一响应者
        self.nameTextF.enabled = true;
        self.phoneTextF.enabled = true;
        [self.phoneTextF becomeFirstResponder];
        // 保存按钮显示
        self.saveButton.hidden = false;
        // 编辑文字变为取消
        sender.title = @"取消";
    }else{
        self.nameTextF.enabled = false;
        self.phoneTextF.enabled = false;
        [self.view endEditing:true];
        
        self.saveButton.hidden = true;
        
        sender.title = @"编辑";
        // 恢复之前的数据
        self.nameTextF.text = self.contactItem.name;
        self.phoneTextF.text = self.contactItem.phone;
    }
    
    
}




#pragma mark --------------------
#pragma mark - 保存按钮点击事件
- (IBAction)saveButtonClick:(UIButton *)sender {
    // 修改模型
    self.contactItem.name = self.nameTextF.text;
    self.contactItem.phone = self.phoneTextF.text;
    // 通知上一个控制器刷新列表
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil userInfo:nil];
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
