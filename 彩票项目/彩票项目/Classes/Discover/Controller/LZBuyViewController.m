//
//  LZBuyViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZBuyViewController.h"
#import "LZTitleViewButton.h"

@interface LZBuyViewController ()

/** 标题按钮 */
@property(nonatomic, weak) UIButton *button;

@end

@implementation LZBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s  line = %d", __func__, __LINE__);
    // 1.设置titleview
    UIButton *button = [[LZTitleViewButton alloc] init];
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部采购" forState:UIControlStateNormal];
    // 自动计算尺寸
    [button sizeToFit];
    self.button = button;
    self.navigationItem.titleView = button;
    
    // 2. 设置左侧返回按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.button setTitle:@"全部采用全部采购全部采购全部采购" forState:UIControlStateNormal];
//    [self.button sizeToFit];
}

@end
