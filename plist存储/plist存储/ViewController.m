//
//  ViewController.m
//  plist存储
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPerson.h"

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
    // 方式一:写数组
    NSArray *dataArray = @[@"lz", @"18"];
    
    // 第一个参数：搜索的目录
    // 第二个参数：搜索的范围
    // 第三个参数：是否展开路径(在iOS开发当中不识别~，手机开发必须使用全路径，MAC开发下识别~)
    NSString *pathString = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    // stringByAppendingString：拼接文件路径格式不正确
//    NSString *filePath = [pathString stringByAppendingString:@"data.plist"];
    // 拼接一个文件路径，自动加一个‘/’(专门用于文件名拼接)
    NSString *filePath = [pathString stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"filePath == %@", filePath);
    // 将数组保存到沙盒
    // 存储的沙盒路径
    [dataArray writeToFile:filePath atomically:YES];
    
    // 方式二：存储字典
//    NSDictionary *dict = @{@"name":@"lz", @"age":@"18"};
//    // 存储路径
//    NSString *dictPath = [pathString stringByAppendingPathComponent:@"dict.plist"];
//    [dict writeToFile:dictPath atomically:true];
    
    LZPerson *person = [[LZPerson alloc] init];
    person.name = @"lz";
    person.age = 10;
    
    NSString *pathStr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true)[0];
    // 在plist当中不能保存自定义的对象
    NSDictionary *dict = @{@"name":@"lz", @"age":@"18"};
    // 存储路径
    NSString *dictPath = [pathStr stringByAppendingPathComponent:@"dict.plist"];
    [dict writeToFile:dictPath atomically:true];
    
    
}

- (IBAction)readButtonClick:(UIButton *)sender {
    // 方式一：读取数组
    NSString *pathString = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    // 拼接一个文件名(专门用于文件名拼接)
    NSString *filePath = [pathString stringByAppendingPathComponent:@"data.plist"];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"dataarray == %@", dataArray);
    
    // 方式二:读取字典
    NSString *dictPath = [pathString stringByAppendingPathComponent:@"dict.plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:dictPath];
    NSLog(@"dict === %@", dict);
}

@end
