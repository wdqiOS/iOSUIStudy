//
//  ViewController.m
//  事件的传递
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
    1. 当一个控件如果它的父控件不能够接收事件，那么它里面子控件也是不能接收事件的。
    2. 当一个控件隐藏的时候，它里面的子控件也跟着隐藏.
    3. 当一个控件透明的时候，它里面的子控件也跟着透明（0 ~ 0.01）
 
 如何找到最合适的控件来处理事件？
 1. 自己是否能接收触摸事件
 2. 触摸点是否在自己身上
 3. 从后往前遍历子控件，重复前面的两个步骤
 
 1. 先去判断当前的view是不是控制器的view，如果当前的view是控制器的view，那么它上一个响应者就是它所在的控制器
 2. 如果当前view不是控制器的view，那么上一个响应者就是它的父控件
 
 // 事件传递的完整过程：
 1. 先将事件对象由上往下传递（由父控件传递给子控件），找到最合适的控件来处理这个事件
 2. 调用最合适控件的touches方法
 3. 如果调用了[super touches:]就会将事件顺着响应者链条往上传递，传递给上一x个响应者
 4. 接着就会调用上一个响应者的touches……方法
 
 如何判断上一个响应者：
 1. 如果当前这个view是控制器view，那么控制器就是上一个响应者
 2. 如果当前这个view不是控制器的view，那么父控件就是上一个响应者
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
