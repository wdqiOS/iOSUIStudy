//
//  ViewController.m
//  transform
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --------------------
#pragma mark - 按钮点击事件
- (IBAction)moveUp:(id)sender {
    // 平移
    [UIView animateWithDuration:1 animations:^{
        // 使用Make,它是相对于最原始的位置的形变
//        self.imageV.transform = CGAffineTransformMakeTranslation(0, -100);
        // 相对于上一次做形变
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, -100);
    }];
    
}

- (IBAction)moveDown:(id)sender {
    // 平移
    [UIView animateWithDuration:1 animations:^{
        // 使用Make,它是相对于最原始的位置的形变
        //        self.imageV.transform = CGAffineTransformMakeTranslation(0, -100);
        // 相对于上一次做形变
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, 100);
    }];
}

- (IBAction)rotation:(id)sender {
    // 旋转(旋转的度数，是一个弧度)
    [UIView animateWithDuration:2 animations:^{
//        self.imageV.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, M_PI_4);
    }];
    
}

// 缩放按钮点击事件
- (IBAction)scale:(id)sender {
    // 缩放
    [UIView animateWithDuration:2 animations:^{
        // 按照比例进行缩放
//        self.imageV.transform = CGAffineTransformMakeScale(1.5, 1);
        self.imageV.transform = CGAffineTransformScale(self.imageV.transform, 0.5, 0.5);
    }];
    
}




@end
