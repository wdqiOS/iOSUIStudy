//
//  ViewController.m
//  block讲解
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

// 变量类型
// 参数类型：void(^)()
typedef void(^MyBlock)(void);

#import "ViewController.h"

@interface ViewController ()

/** block */
@property(nonatomic, copy) MyBlock block2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // block 可以保存一段代码，在需要的时候调用
    // 1. 定义没有参数，没有返回值的block
    // 参数类型void(^)()
    // block 变量名
    void(^block)(void) = ^(){
       NSLog(@"%s  line = %d", __func__, __LINE__);
    };
    block();
    /*
     block 快捷键 inlineBlock
    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
        <#statements#>
    };
     */
    
    // 在开发中，一般都是跨方法调用
    // 给block起别名的方式定义
//    MyBlock block1 = ^(){
//      NSLog(@"%s  line = %d", __func__, __LINE__);
//    };
//
//    block1();
    
    // 保存代码
    // 2. 跨方法调用
    self.block2 = ^(){
        NSLog(@"%s  line = %d", __func__, __LINE__);
    };
    
    
    // 3. block 当做参数传递
    [UIView animateWithDuration:0 animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 调用block
    self.block2();
}




@end
