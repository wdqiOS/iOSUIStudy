//
//  ViewController.m
//  autolayout练习
//
//  Created by 汪大强 on 2018/10/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTestViewController.h"
#import "LZAutoHeightViewController.h"

@interface ViewController ()

/** 测试label */
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self presentViewController:[LZTestViewController new] animated:true completion:nil];
    
    
    
    [self presentViewController:[LZAutoHeightViewController new] animated:true completion:^{
        self.label.text = @"小雅！";
        [UIView animateWithDuration:10 animations:^{
            self.label.text = @"小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！小雅！";
        }];
    }];
}


@end
