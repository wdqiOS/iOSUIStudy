//
//  ViewController.m
//  KVO的使用
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//


/*
 KVO: Key Value Observing (键值监听)---> 当某个对象的属性值发生改变的时候（用KVO监听）
 */

#import "ViewController.h"
#import "LZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LZPerson *person = [[LZPerson alloc] init];
    person.name = @"李哲";
    
    /*
     作用：给对象绑定一个监听器（观察者）
     - Observer 观察者
     - KeyPath 监听的属性
     - options 选项（方便方法中拿到属性值）
     */
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
    
    person.name = @"汪大强";
    
    person.name = @"王五";
    
   

    // 移除监听
    [person removeObserver:self forKeyPath:@"name"];
}


/**
 当监听的属性值发生改变

 @param keyPath 要改变的属性
 @param object 要改变的属性所属的对象
 @param change 改变的内容
 @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@------%@------%@", keyPath, object ,change);
}


@end
