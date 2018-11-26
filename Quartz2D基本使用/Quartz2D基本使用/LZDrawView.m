//
//  LZDrawView.m
//  Quartz2D基本使用
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDrawView.h"

@implementation LZDrawView
-(void)awakeFromNib{
    [super awakeFromNib];
    /*
     // 椭圆
     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
     // 使用UIBezierPath提供的绘图方法进行绘制
     // 1. 获取上下文 -> 2. 描述路径. -> 3. 把路径添加到上下文 -> 4. 把上下文的内容渲染到view上。只有在drawRect:方法当中才能够获取上下文，在awakeFromNib获取不到上下文，所以不能进行绘图。
     [path stroke]; // 1. 获取上下文 -> 2. 描述路径. -> 3. 把路径添加到上下文 -> 4. 把上下文的内容渲染到view上
     */
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

/**
 作用：专门用来绘图
 什么时候调用：当view显示的时候，系统自动调用
 @param rect rect:当前view的bounds
 */
- (void)drawRect:(CGRect)rect {
//    NSLog(@"%s", __func__);
//    NSLog(@"rect === %@", NSStringFromCGRect(rect));

    [self drawProress:rect];
    
}



#pragma mark --------------------
#pragma mark - 下载进度

-(void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    
    // 注意：drawRect如果是手动调用的话，它是不会给你创建跟view相关联的上下文
    // 只有系统调用该方法时，才会创建跟view相关联的上下文
//    [self drawRect:self.bounds];
    // 重绘（系统自动帮你调用drawRect:）
    [self setNeedsDisplay];
    
    
}

-(void)drawProress:(CGRect)rect{
    // 画弧
    // 1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2、 开始描述路径
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle = self.progressValue * M_PI * 2 ;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
//    [path addLineToPoint:center];
//    [path closePath];
    [[UIColor colorWithRed:255/255.0f green:0 blue:0 alpha:1] set];
    CGContextSetLineWidth(ctx, 10);
    // 3. 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    // 4. 把上下文渲染到view的layer上
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
}

#pragma mark --------------------
#pragma mark - 画弧形
-(void)drawArcCenter:(CGRect)rect{
    // 1. 获取上下文
    // 2. 设置路径
    // 3. 将路径添加到上下文
    // 4. 将上下文内容渲染到view上
    // 画弧
    // Center：弧所在的圆心
    // radius：圆的半径
    // startAngle: 开始角度
    // endAngle: 结束角度
    // clockwise:YES 顺时针 NO: 逆时针
    NSLog(@"%@", NSStringFromCGPoint(self.center));
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    // 为什么不能直接使用self.center， 是因为self.center坐标是相对于它的父控件。
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    
    // 添加一根线到圆心
    [path addLineToPoint:center];
    
    // 关闭路径closePath:从路径的终点连接一根线到路径的起点
    [path closePath];
    
    // 设置颜色
    [UIColor.redColor set];
    // 画扇形
    // fill(填充之前，会自动关闭路径)
    [path fill];
}

#pragma mark --------------------
#pragma mark - 画圆
-(void)drawCycle{
//    // 1. 获取上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 开始描述路径
    // 椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
    // 设置颜色
    [[UIColor redColor] set];
    
//    [path moveToPoint:CGPointMake(50, 50)];
//    [path addLineToPoint:CGPointMake(250, 250)];
//
//    [path setLineWidth:10];
    
    
    // 使用UIBezierPath提供的绘图方法进行绘制
    [path stroke]; // 1. 获取上下文 -> 2. 描述路径. -> 3. 把路径添加到上下文 -> 4. 把上下文的内容渲染到view上
    
    
//    // 3. 把路径添加到上下文中
//    CGContextAddPath(ctx, path.CGPath);
//    // 4. 将上下文内容渲染到view上
//    CGContextStrokePath(ctx);
}


#pragma mark --------------------
#pragma mark - 绘制图形
-(void)drawRect{
    // 1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 开始描述路径
    // 画矩形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    // 画圆角矩形
    // cornerRadius: 圆角半径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    // 设置
    [[UIColor yellowColor] set];
    // 3. 把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    // 4. 把上下文内容渲染到view上
//    CGContextStrokePath(ctx); // 描边
    CGContextFillPath(ctx); // 填充
}


#pragma mark --------------------
#pragma mark - 绘制曲线
-(void)drawCurve{
    // 1. 获取绘制上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 设置绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 画曲线
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 2.2 添加一根曲线到某一个点
    [path addQuadCurveToPoint:CGPointMake(250, 280) controlPoint:CGPointMake(250, 50)];
    // 3. 把绘制的路径添加到上下文中
    CGContextAddPath(ctx, path.CGPath);
    // 4. 把上下文内容显示到view上（渲染到view的layer）(stroke:描边 fill:填充)
    CGContextStrokePath(ctx);
}

#pragma mark --------------------
#pragma mark - 画直线
-(void)drawLine{
    // 绘图
    // 1. 在drawRect方法当中系统已经帮你创建了一个跟view相关联的上下文(Layer上下文)
    // 获取上下文就可以了
    
    // 1. 获取上下文(获取、创建上下文都以UIGraphics开头)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 2. 绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 2.2 添加一根线到终点
    [path addLineToPoint:CGPointMake(250, 50)];
    
    // 画第二条线
    //    [path moveToPoint:CGPointMake(250, 50)];
    //    [path addLineToPoint:CGPointMake(250, 100)];
    // addLineToPoint: 上一条线的终点当做是下一条线的起点
    [path addLineToPoint:CGPointMake(200, 280)];
    
    // 上下文的状态
    // 设置线宽
    CGContextSetLineWidth(ctx, 10);
    // 设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 设置线的顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 设置颜色（set:自动判断使用的是stroke还是fill）
    [[UIColor redColor] set];
    
    
    // 3. 把绘制的内容添加到上下文当中
    // CGContextRef: UIKit框架 ---> CGPathRef: CoreGraphics框架
    CGContextAddPath(ctx, path.CGPath);
    // 4. 把上下文内容显示到view上（渲染到view的layer）(stroke:描边 fill:填充)
    CGContextStrokePath(ctx);
}


@end
