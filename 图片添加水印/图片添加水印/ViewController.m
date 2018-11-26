//
//  ViewController.m
//  图片添加水印
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 0. 加载图片
    UIImage *image = [UIImage imageNamed:@"卡哇伊"];
    // 1. 开启一个跟图片原始大小的上下文
    // opaque: 不透明
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2. 将图片绘制到上下文当中
    [image drawAtPoint:CGPointZero];
    // 3. 将文字绘制到上下文当中
    NSString *str = @"李哲";
    [str drawAtPoint:CGPointMake(10, 20) withAttributes:nil];
    
    UIImage *logo = [UIImage imageNamed:@"阿狸头像"];
    [logo drawInRect:CGRectMake(150, 0, 50, 50)];
    // 4. 从上下文当中生成一张图片(把上下文当中绘制的内容生成一张图片)
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageV.image = newImage;
    
    
}


@end
