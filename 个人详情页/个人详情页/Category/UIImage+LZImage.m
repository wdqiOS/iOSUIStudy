//
//  UIImage+LZImage.m
//  个人详情页
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "UIImage+LZImage.h"

@implementation UIImage (LZImage)

// 根据颜色生成UIImage
+(UIImage*)imageWithColor:(UIColor*)color{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开始画图的上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}


@end
