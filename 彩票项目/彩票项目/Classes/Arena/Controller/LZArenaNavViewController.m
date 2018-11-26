//
//  LZArenaNavViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZArenaNavViewController.h"

@interface LZArenaNavViewController ()

@end

@implementation LZArenaNavViewController



+(void)initialize{
    // 设置导航条背景图片
    
    // 1. 获取导航条标志
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    // 2. 设置背景图片
    // 2.1 拉伸图片
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
 
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
