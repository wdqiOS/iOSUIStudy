//
//  LZLoginViewController.m
//  纯代码实现通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZLoginViewController.h"
#import "MBProgressHUD.h"
#import "LZContactVC.h"

#define LZAccount       @"account"
#define LZPwd           @"pwd"
#define LZIsRem         @"isRem"
#define LZIsAutoLogin   @"isAutoLogin"

/**
 应用数据的存储方法：
 1. XML属性列表（plist）:小数据
 2. preference(偏好设置):小数据
 3. NSKeyedArchiver归档（NSCoding）:自定义模型的存储，小数据
 4. SQLite3 ： 大数据
 5. Core Data ： 大数据
 
 应用沙盒：
 每个iOS应用都有自己的应用沙盒（应用沙盒就是文件系统目录），与其他文件系统隔离。应用必须待在自己的沙盒里，
 其他应用不能访问该沙盒。（通过NSHomeDirectory()获取沙盒的根目录）
 沙盒结构分析：
 应用程序包：（layer）包含了所有的资源文件和可执行文件
 Documents:保存应用运行时生成的需要持久化的数据，iTuns同步设备会备份该目录。例如：游戏应用可将游戏存档保存在该目录
 tmp：保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也可能会清除该目录下的文件。iTuns同步设备时不会备份该目录。
 Library/Caches:保存应用运行时生成的需要持久化的数据，iTuns同步设备时不会备份该目录。一般存储体积大、不需要备份的非重要数据
 Library/Preferences:保存应用的所有偏好设置，iOS的Settings(设置)应用会在该目录中查找应用的设置信息。iTuns同步设备时会备份该目录
 SystemData:系统数据
 
 
 */

@interface LZLoginViewController ()

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
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"欢迎进入通讯录";
    
    // 先从沙盒中取出来保存的设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.remPwdSwitch.on = [defaults boolForKey:LZIsRem];
    self.autoLoginSwitch.on = [defaults boolForKey:LZIsAutoLogin];
    
    if (self.remPwdSwitch.on == true) {
        self.accountTextF.text = [defaults objectForKey:LZAccount];
        self.pwdTextF.text = [defaults objectForKey:LZPwd];
        // 自动登录
        if (self.autoLoginSwitch.on == true) {
            [self loginBtnClick:self.loginBtn];
        }
    }
    
    
    
    
    
    NSLog(@"%@", NSHomeDirectory());
    
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
#pragma mark - 登录按钮点击事件

- (IBAction)loginBtnClick:(UIButton *)sender {
    // 收起键盘
    [self.view endEditing:true];
    // 提醒用户正在登陆
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"正在登陆，请稍后……";
    // 模拟网络延时，延时执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self jumpTo:hud];
    });
    
}

-(void)jumpTo:(MBProgressHUD *)hud{
    // 如果用户名密码正确，才跳转到下一页面
    if([self.accountTextF.text isEqualToString:@"lz"] && [self.pwdTextF.text isEqualToString:@"123"]){
        [hud hideAnimated:true];
        
        // 保存用户名和密码到沙盒
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.accountTextF.text forKey:LZAccount];
        [defaults setObject:self.pwdTextF.text forKey:LZPwd];
        [defaults setBool:self.remPwdSwitch.on forKey:LZIsRem];
        [defaults setBool:self.autoLoginSwitch.on forKey:LZIsAutoLogin];
        // 立马写入到文件
        [defaults synchronize];
        
        // 跳转到下一页面
        LZContactVC *contactVC = [[LZContactVC alloc] init];
        contactVC.accountName = self.accountTextF.text;
        [self.navigationController pushViewController:contactVC animated:true];
        
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

@end
