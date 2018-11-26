//
//  LZDrawView.m
//  上下文栈
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDrawView.h"

@implementation LZDrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 1. 获取上下文
    // 内存中开辟了两个空间（一份空间保存路径，一份保存上下文状态）
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 开始描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addLineToPoint:CGPointMake(280, 150)];
    

    
    // 3. 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 保存当前上下文状态(将当前上下文状态复制一份保存到上下文状态栈中)
    // 当前上下文状态为系统上下文状态(此时状态栈中有一份上下文状态)
    CGContextSaveGState(ctx);
    
    
    // 设置上下文状态
    CGContextSetLineWidth(ctx, 10);
    [UIColor.redColor set];
    // 当前上下文状态为设置的上下文状态（此时状态栈中会有两个上下文状态）
    CGContextSaveGState(ctx);
    
    // 4. 将上下文内容渲染到view上
    CGContextStrokePath(ctx);
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150, 20)];
    [path2 addLineToPoint:CGPointMake(150, 280)];
    CGContextAddPath(ctx, path2.CGPath);
    // 设置上下文状态
//    CGContextSetLineWidth(ctx, 1);
//    [UIColor.blackColor set];
    // 从上下文状态栈中恢复上下文的状态
    CGContextRestoreGState(ctx);
//    CGContextRestoreGState(ctx);

    CGContextStrokePath(ctx);
}


@end
