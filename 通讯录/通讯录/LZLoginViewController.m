//
//  LZLoginViewController.m
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZLoginViewController.h"
#import "MBProgressHUD.h"
#import "LZContactVC.h"


@interface LZLoginViewController ()<UITextFieldDelegate>
/** 账号输入框 */
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
/** 密码输入框 */
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
/** 登录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

/** 记住密码switch */
@property (weak, nonatomic) IBOutlet UISwitch *remPwdSwitch;
/** 自动登录switch */
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;


@end

@implementation LZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 监听账号和密码输入框同时有值的时候，让登录按钮能够点击 不能使用代理，统计的不准
//    self.accountTextF.delegate = self;
//    self.pwdTextF.delegate = self;
    // 使用添加事件监听
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 手动判断账号和密码输入框是否同时有值
    [self textChange];
}

#pragma mark --------------------
#pragma mark - 文本框事件监听
// 当文本框内容发生改变时调用
-(void)textChange{
//    if (self.accountTextF.text.length && self.pwdTextF.text.length) {
//        // 让登录按钮可以点击
//        self.loginBtn.enabled = true;
//    }else{
//        self.loginBtn.enabled = false;
//    }
    self.loginBtn.enabled = (self.accountTextF.text.length && self.pwdTextF.text.length);
}

#pragma mark --------------------
#pragma mark - switch点击事件
// 记住密码switch点击事件
- (IBAction)remPwdChange:(UISwitch *)sender {
    //
    if (sender.on == false) {
        [self.autoLoginSwitch setOn:sender.on animated:true];
    }
    
}
// 自动登录switch点击事件
- (IBAction)autoLoginChange:(UISwitch *)sender {
    if (self.autoLoginSwitch.on == true) {
        [self.remPwdSwitch setOn:true animated:true];
    }
}


#pragma mark --------------------
#pragma mark - 登录按钮点击事件

- (IBAction)loginBtnClick:(UIButton *)sender {
    // 提醒用户正在登陆
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"登陆中";
    // 模拟网络延时，延时执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self jumpTo:hud];
    });
    
}

-(void)jumpTo:(MBProgressHUD *)hud{
    // 如果用户名密码正确，才跳转到下一页面
    if([self.accountTextF.text isEqualToString:@"lz"] && [self.pwdTextF.text isEqualToString:@"123"]){
        [hud hideAnimated:true];
        // 跳转到下一页面
        // 手动执行线（segue）
        [self performSegueWithIdentifier:@"contactVC" sender:nil];
        
    }else{
        // 提醒用户
        [hud hideAnimated:true];
        // 1. 创建 UIAlertController
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"用户名或密码错误, 请重试" preferredStyle:UIAlertControllerStyleAlert];
        // 2. 创建按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self.accountTextF becomeFirstResponder];
        }];
        // 3. 添加按钮
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        // 4. 显示 UIAlertController
        [self presentViewController:alertController animated:true completion:nil];
    }
    
    /*
     performSegueWithIdentifier底层实现：
     1. 到storyboard当中去查找有没有查找给定标识的segue.
     2. 根据指定的标识，创建一个UIStoryboardSegue对象之后，把当前的控制器设置为UIStoryboardSegue对象的源控制器（sourceViewController）给它源控制器属性赋值。
     3. 再去创建UIStoryboardSegue对象的目标控制器（destinationViewController），给IStoryboardSegue对象的目标控制器属性赋值。
     4. 调用当前控制器的prepareForSegue：方法，告诉用户，当前的线已经准备好了.
     5. [segue perform]方法底层实现：[segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:true];
     
     */
}

// 准备跳转前调用
// 做一些传递数据

// 传递数据（顺传数据）
// 1. 数据接收的控制器定义一个属性来接收数据。
// 2. 数据的来源控制器要拿到数据接收的控制器。
// 3. 给接收的控制器的接收数据的属性赋值。
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // 目标控制器
//    segue.destinationViewController;
    // 源控制器
//    segu.sourceViewController;
    
    LZContactVC *contactVC = (LZContactVC *)segue.destinationViewController;
    contactVC.accountName = self.accountTextF.text;
    
//    [segue perform];
//    [segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:true];
}






//#pragma mark --------------------
//#pragma mark - UITextFieldDelegate
//// 不能使用代理，统计的不准
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    if (self.accountTextF.text.length && self.pwdTextF.text.length) {
//        // 让登录按钮可以点击
//        self.loginBtn.enabled = true;
//    }else{
//        self.loginBtn.enabled = false;
//    }
//    return YES;
//}



@end
