//
//  ViewController.m
//  模拟通知
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPerson.h"
#import "LZCompany.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LZCompany *com1 = [[LZCompany alloc] init];
    com1.name = @"Tencent";
    
    LZCompany *com2 = [[LZCompany alloc] init];
    com2.name = @"Sina";
    
    LZPerson *p1 = [[LZPerson alloc] init];
    p1.name = @"张三";
    
    LZPerson *p2 = [[LZPerson alloc] init];
    p2.name = @"李四";
    
    LZPerson *p3 = [[LZPerson alloc] init];
    p3.name = @"王五";
    
    /*** 模拟通知 ****/
    // 监听通知必须在发布通知之前，否则监听不到
    // 只监听com1发布的通知
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNews:) name:nil object:com1];
    // 监听所有的通知
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNews:) name:nil object:nil];
    
    // 监听通知名为军事新闻的通知
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNews:) name:@"军事新闻" object:nil];
     // 发布通知
    NSNotification *note = [NSNotification notificationWithName:@"军事新闻" object:com1 userInfo:@{@"title":@"xxxxx"}];
    [[NSNotificationCenter defaultCenter] postNotification:note];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:com1 userInfo:@{@"title":@"aaaa"}];
    
    // 匿名通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:nil userInfo:@{@"title":@"aaaa"}];
    
    // 移除通知
//    [[NSNotificationCenter defaultCenter] removeObserver:p1 name:@"军事新闻" object:com1];
    // 移除p1的监听 放在监听对象销毁之前移除
    [[NSNotificationCenter defaultCenter] removeObserver:p1];
    
    /*
    NSLog(@"%@", [UIDevice currentDevice].systemVersion);
    // 系统适配
    double version = [UIDevice currentDevice].systemVersion.doubleValue;
    if (version >= 9.0) {
        
    }else if(version >= 8.0){
        
    }else{
        
    }
     */
}


@end
