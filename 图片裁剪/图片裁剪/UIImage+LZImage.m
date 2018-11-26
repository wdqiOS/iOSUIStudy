//
//  UIImage+LZImage.m
//  图片裁剪
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "UIImage+LZImage.h"

@implementation UIImage (LZImage)

+(UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image{
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

@end
