//
//  ViewController.m
//  图片裁剪
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LZImage.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [self drawBorder];
}

-(void)drawBorder{
    
    
    self.imageV.image = [UIImage imageWithBorder:10 color:[UIColor redColor] image:[UIImage imageNamed:@"3"]];
}

-(UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image{
    // 0.加载图片
//    UIImage *image = [UIImage imageNamed:@"3"];
    // 1. 确定边框宽度
//    CGFloat borderW = 5;
    // 2. 开启上线文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 3. 绘制大圆,显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    // 显示
    [path fill];
    // 4. 绘制小圆，把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];
    // 5. 将图片绘制到上下文当中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    // 6. 从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 7. 关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(void)drawCycle{
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    // 1. 开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2. 设置圆形裁剪区域
    // 2.1 绘制一个圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 2.2 把圆形路径设置为裁剪区域
    [path addClip];
    // 3. 把图片绘制到上下文当中（超过裁剪区域以外的内容都被裁减掉）
    [image drawAtPoint:CGPointZero];
    
    //    NSString *str = @"李哲";
    //    [str drawAtPoint:CGPointMake(50, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:30]}];
    // 4. 从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageV.image = newImage;
}


@end
