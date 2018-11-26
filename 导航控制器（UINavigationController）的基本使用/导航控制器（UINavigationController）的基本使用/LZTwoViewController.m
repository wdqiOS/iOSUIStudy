//
//  LZTwoViewController.m
//  导航控制器（UINavigationController）的基本使用
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTwoViewController.h"
#import "LZThreeViewController.h"

@interface LZTwoViewController ()

@end

@implementation LZTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"第二个控制器";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)jumpToNextVC:(id)sender {
    LZThreeViewController *threeVC = [[LZThreeViewController alloc] init];
    [self.navigationController pushViewController:threeVC animated:true];
}

@end
