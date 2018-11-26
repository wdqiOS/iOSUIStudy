//
//  LZMyViewController.m
//  抽屉效果
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZMyViewController.h"
#import "LZTableViewController.h"

@interface LZMyViewController ()

@end

@implementation LZMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 当一个控制器的view添加到另一个控制器的view上的时候，此时view所在的控制器也应该成为上一个控制器的子控制器
    LZTableViewController *tab1 = [[LZTableViewController alloc] init];
    tab1.view.frame = self.mainV.bounds;
    [self.mainV addSubview:tab1.view];
    
    [self addChildViewController:tab1];
    
    
    LZTableViewController *tab2 = [[LZTableViewController alloc] init];
    tab2.view.frame = self.leftV.bounds;
    [self.leftV addSubview:tab2.view];
    
    [self addChildViewController:tab2];
    
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
