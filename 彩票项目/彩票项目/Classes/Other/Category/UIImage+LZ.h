//
//  UIImage+LZ.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LZ)


/**
 图片不要渲染
 @param name 图片名称
 @return 返回一张不要渲染的图片
 */
+(UIImage *)imageWithRenderOriginalName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
