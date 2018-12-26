//
//  LZMyLotteryViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZMyLotteryViewController.h"
#import "LZSettingTableViewController.h"

@interface LZMyLotteryViewController ()
/** 登录按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LZMyLotteryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1. 设置button的背景图片
    // 1.1 拿到button的背景图片
    UIImage *image = self.loginBtn.currentBackgroundImage;
    // 1.2. 拉伸图片
   image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    // 1.3. 设置图片
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    // 2. 设置左侧按钮
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [button setTitle:@"客服" forState:UIControlStateNormal];
    [button sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    // 3. 设置右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(config)];
}

#pragma mark --------------------
#pragma mark - 导航条右侧按钮点击的时候调用
-(void)config{
    NSLog(@"%s  line = %d", __func__, __LINE__);
    LZSettingTableViewController *setting = [[LZSettingTableViewController alloc] init];
//    setting.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:setting animated:true];
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
