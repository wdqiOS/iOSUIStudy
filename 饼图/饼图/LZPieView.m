//
//  LZPieView.m
//  饼图
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPieView.h"

@implementation LZPieView

-(void)drawRect:(CGRect)rect{
    // 绘制饼图
    NSArray *dataArray = @[@25,@25,@50];
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.integerValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [[self randomColor] set];
        [path addLineToPoint:center];
        [path fill];
    }
    
    
//    [self drawPie:rect];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 重绘
    [self setNeedsDisplay];
}

#pragma mark --------------------
#pragma mark - 生成随机颜色
-(UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
}


#pragma mark --------------------
#pragma mark - 方法一：代码冗余，不宜使用
-(void)drawPie:(CGRect)rect{
     // 画第一个扇形
     CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
     CGFloat radius = rect.size.width * 0.5 - 10;
     CGFloat startA = 0;
     CGFloat angle = 25 / 100.0 * M_PI * 2;
     CGFloat endA = startA + angle;
     UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
     [[UIColor redColor] set];
     // 添加一根线到圆心
     [path addLineToPoint:center];
     // 关闭路径
     [path fill];
     
     // 画第二个扇形
     startA = endA;
     angle = 25 / 100.0 * M_PI * 2;
     endA = startA + angle;
     path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
     [[UIColor blueColor] set];
     // 添加一根线到圆心
     [path addLineToPoint:center];
     // 关闭路径
     [path fill];
     
     // 第三个饼图
     startA = endA;
     angle = 50 / 100.0 * M_PI * 2;
     endA = startA + angle;
     path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
     [[UIColor purpleColor] set];
     // 添加一根线到圆心
     [path addLineToPoint:center];
     // 关闭路径
     [path fill];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
