//
//  ViewController.m
//  Quartz2D基本使用
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZDrawView.h"

@interface ViewController ()
/** 进度值 */
@property (weak, nonatomic) IBOutlet UILabel *valueTitle;
/** 进度view */
@property (weak, nonatomic) IBOutlet LZDrawView *progressView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s", __func__);
}

#pragma mark --------------------
#pragma mark - UISlider
- (IBAction)valueChange:(UISlider *)sender {
    // 获取进度值
    NSLog(@"%f", sender.value);
    // %在stringWithFormat中有特殊含义，不能直接使用，如果想要使用，用两个%%代表一个%
    self.valueTitle.text = [NSString stringWithFormat:@"%.2f%%", sender.value * 100];
    self.progressView.progressValue = sender.value;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
}


@end
