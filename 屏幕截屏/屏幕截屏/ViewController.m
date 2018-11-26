//
//  ViewController.m
//  屏幕截屏
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 把控制器的view生成一张图片
    
    // 1. 开启一个位图上下文（跟当前控制器view一样大小的尺寸）
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 2. 把控制器view绘制到上下文中
    // 想要把UIView上面的东西给绘制到上下文当中，必须得要使用渲染的方式
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    
    // 3. 从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4. 关闭上下文
    UIGraphicsEndImageContext();
    
    // 把生成的图片写入到桌面(文件方式进行传输:二进制流NSData)
    // 把图片转成二进制流
//    NSData *imageData = UIImageJPEGRepresentation(newImage, 1);
    NSData *imageData = UIImagePNGRepresentation(newImage);
    [imageData writeToFile:@"/Users/wangdaqiang/Desktop/newImage.png" atomically:true];
    
    
}


@end
