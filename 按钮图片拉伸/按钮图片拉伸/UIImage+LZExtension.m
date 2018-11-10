//
//  UIImage+LZExtension.m
//  按钮图片拉伸
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "UIImage+LZExtension.h"

@implementation UIImage (LZExtension)

/**
 返回一张受保护的图片
 
 @param localImageName 图片名称
 @return 返回的图片
 */
+(instancetype)resizeableImageWithLocalImageName:(NSString *)localImageName{
    // 创建图片对象
    UIImage *image = [UIImage imageNamed:localImageName];
    
    // 获取图片的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    return [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
    
}

@end
