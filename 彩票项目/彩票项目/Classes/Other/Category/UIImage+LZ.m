//
//  UIImage+LZ.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "UIImage+LZ.h"

@implementation UIImage (LZ)

// 返回一张不要渲染的图片
+(UIImage *)imageWithRenderOriginalName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
