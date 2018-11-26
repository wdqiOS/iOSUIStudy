//
//  ViewController.m
//  偏好设置
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

/**
 
 偏好设置：
 很多iOS应用都支持偏好设置，比如保存用户名、密码、字体大小等设置，iOS提供了一套标准的解决方案来为应用加入偏好设置功能
 每个应用都有个NSUserDefaults实例，通过它来存取偏好设置：比如保存用户名、字体大小、是否自动登录
 
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --------------------
#pragma mark - 存读按钮点击事件
- (IBAction)saveButtonClick:(UIButton *)sender {
    NSString *librayString = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, true)[0];
    NSLog(@"librarystring ===== %@", librayString);
    
    // NSUserDefaults它保存的也是一个plist，内部是一个字典
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"lz" forKey:@"name"];
    [defaults setInteger:10 forKey:@"age"];
    // 立马写入到文件当中,同步操作
    [defaults synchronize];

}

- (IBAction)readButtonClick:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *nameString = [defaults objectForKey:@"name"];
    NSLog(@"name === %@", nameString);
    NSInteger age = [defaults integerForKey:@"age"];
    NSLog(@"age === %zd", age);
}

@end
