//
//  LZTwoViewController.m
//  Modal
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTwoViewController.h"

@interface LZTwoViewController ()

@end

@implementation LZTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark --------------------
#pragma mark - 取消按钮的点击事件

- (IBAction)cancelButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
