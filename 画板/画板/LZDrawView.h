//
//  LZDrawView.h
//  画板
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDrawView : UIView

/** 要绘制的图片 */
@property(nonatomic, strong) UIImage *image;

// 清屏
-(void)clear;
// 撤销
-(void)undo;
// 橡皮擦
-(void)erase;
// 设置线的宽度
-(void)setLineWidth:(CGFloat)lineWidth;
// 设置线的颜色
-(void)setLineColor:(UIColor *)lineColor;


@end

NS_ASSUME_NONNULL_END
