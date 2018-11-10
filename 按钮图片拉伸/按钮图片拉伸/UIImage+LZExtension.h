//
//  UIImage+LZExtension.h
//  按钮图片拉伸
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LZExtension)

/**
 返回一张受保护的图片
 
 @param localImageName 图片名称
 @return 返回的图片
 */
+(instancetype)resizeableImageWithLocalImageName:(NSString *)localImageName;

@end

NS_ASSUME_NONNULL_END
