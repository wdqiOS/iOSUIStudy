//
//  UIImage+LZImage.h
//  图片裁剪
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LZImage)


/**
 生成一张带有边框的图片

 @param borderW 边框宽度
 @param borderColor 边框颜色
 @param image 要添加边框的图片
 @return 生成的带有边框的图片
 */
+(UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
