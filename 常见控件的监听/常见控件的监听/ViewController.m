//
//  ViewController.m
//  常见控件的监听
//
//  Created by 汪大强 on 2018/10/9.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate, UITextFieldDelegate>

/** UITextField */
@property(nonatomic, strong) UITextField *tf;

@end

@implementation ViewController

-(UITextField *)tf{
    if (_tf == nil) {
        _tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 40, 200, 40)];
        _tf.placeholder = @"输入";
        _tf.delegate = self;
        [_tf addTarget:self action:@selector(tfClick:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _tf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 2. UIScrollView
    UIScrollView *scrollView = nil;
    scrollView.delegate = self;
    
    // 3. UISegmentedControl
    UISegmentedControl *s = [[UISegmentedControl alloc] initWithItems:@[@"123", @"456", @"789"]];
    s.center = self.view.center;
    s.selectedSegmentIndex = 0;
    [s addTarget:self action:@selector(sClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:s];
    
    // 4.
    [self.view addSubview:self.tf];
    
}

-(void)tfClick:(UITextField *)tf{
    NSLog(@"%s", __func__);
}

#pragma mark --------------------
#pragma mark - UITextField的代理方法

/**
 开始编辑

 @param textField 编辑的textfield
 */
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%s", __func__);
}


/**
 结束编辑

 @param textField 结束编辑的textfield
 */
-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%s", __func__);
}


/**
 当textfield文字改变就会调用这个方法

 @param textField 输入的textfield
 @param range <#range description#>
 @param string 用户输入的文字
 @return YES：允许用户输入 NO：禁止用户输入
 */
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"%s", __func__);
    NSLog(@"%zd  %zd", range.location, range.length);
    
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    
    return YES;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}



/**
 UISegmentedControl点击事件

 @param s UISegmentedControl对象
 */
-(void)sClick:(UISegmentedControl *)s{
    NSLog(@"%s", __func__);
    NSLog(@"%zd", s.selectedSegmentIndex);
}


/**
 按钮点击事件

 @param button UIButton对象
 */
-(void)btnClick:(UIButton *)button{
    NSLog(@"%s", __func__);
}


@end
