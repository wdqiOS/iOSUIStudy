//
//  ViewController.m
//  转盘
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZWheelView.h"

@interface ViewController ()

/** 轮子 */
@property(nonatomic, weak) LZWheelView *wheelView;

@end

@implementation ViewController

-(LZWheelView *)wheelView{
    if (_wheelView == nil) {
        LZWheelView *wheelView = [LZWheelView wheelView];
        wheelView.center = self.view.center;
//        [self.view addSubview:wheelView];
        self.wheelView = wheelView;
    }
    return _wheelView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 添加转盘
    [self.view addSubview:self.wheelView];
//    LZWheelView *wheelView = [[LZWheelView alloc] init];
//    wheelView.center = self.view.center;
//    [self.view addSubview:wheelView];
    
}

#pragma mark --------------------
#pragma mark - 转盘旋转、暂停
- (IBAction)rotation:(id)sender {
    [self.wheelView rotation];
}

- (IBAction)stop:(id)sender {
    [self.wheelView stop];
}


@end
