//
//  ViewController.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthDayTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.countryTextF.delegate = self;
    self.birthDayTextF.delegate = self;
    self.cityTextF.delegate = self;
}

#pragma mark --------------------
#pragma mark - UITextFieldDelegate
// 是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
// 开始编辑时调用（成为第一响应者）
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"%s", __func__);
}
// 是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return false;
}
// 结束编辑时调用
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%s", __func__);
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
    
}

// 是否允许改变文本框内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return false;
}
// 是否允许清除
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return true;
}
// 是否允许点击retun
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return true;
}

@end
