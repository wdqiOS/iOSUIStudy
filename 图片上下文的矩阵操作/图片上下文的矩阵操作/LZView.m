//
//  LZView.m
//  图片上下文的矩阵操作
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZView.h"

@implementation LZView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 50)];
    
    // 平移操作
    CGContextTranslateCTM(ctx, 100, 100);
    // 旋转
    CGContextRotateCTM(ctx, M_PI_4);
    // 缩放
    CGContextScaleCTM(ctx, 1.5, 1.5);
    
    // 3. 添加路径到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 设置上下文状态
    [UIColor.redColor set];
    // 4. 将上下文渲染到view上
    CGContextFillPath(ctx);
    
}


@end
