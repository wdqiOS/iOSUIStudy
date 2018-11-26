//
//  LZDrawView.m
//  画板
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDrawView.h"
#import "LZMyBezierPath.h"

@interface LZDrawView ()

/** 记录绘制的路径 */
@property(nonatomic, strong) UIBezierPath *path;

/** 保存当前绘制的所有路径 */
@property(nonatomic, strong) NSMutableArray *allPathArray;

/** 当前路径的线宽 */
@property(nonatomic, assign) CGFloat width;

/** 当前路径的线颜色 */
@property(nonatomic, strong) UIColor *color;

@end

@implementation LZDrawView

#pragma mark --------------------
#pragma mark - 懒加载保存当前绘制的所有路径可变数组
-(NSMutableArray *)allPathArray{
    if (_allPathArray == nil) {
        _allPathArray = [NSMutableArray array];
    }
    return _allPathArray;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    self.width = 1;
    self.color = [UIColor blackColor];
}

#pragma mark --------------------
#pragma mark - 拖拽手势
-(void)pan:(UIGestureRecognizer *)pan{
    // 获取当前手指的点
    CGPoint curp = [pan locationInView:self];
    // 判断手势状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 创建路径
        LZMyBezierPath *path = [[LZMyBezierPath alloc] init];
        
        // 设置线的宽度
        [path setLineWidth:self.width];
        // 设置线的颜色
        // 什么情况下自定义类：当发现系统原始的功能，没有办法满足自己需求时，这个时候，要自定义类，继承系统原来的东西，再去添加属于自己的东西
        path.color = self.color;
        
        [path setLineJoinStyle:kCGLineJoinRound];
        
        
        
        [self.allPathArray addObject:path];
        self.path = path;
        // 设置起点
        [path moveToPoint:curp];
        
    }else if(pan.state == UIGestureRecognizerStateChanged){
        // 绘制一根线到当前手指所在的点
        [self.path addLineToPoint:curp];
        
        // 重绘(会调用drawRect:方法)
        [self setNeedsDisplay];
    }
    
    
}

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 绘制保存的所有路径
    for (LZMyBezierPath *path in self.allPathArray) {
        // 判断取出来路径的真实类型
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else{
            [path.color set];
            [path stroke];
        }
        
    }
}

#pragma mark --------------------
#pragma mark - 重新图片set方法，绘制到画板上
-(void)setImage:(UIImage *)image{
    _image = image;
    // 添加图片到数组当中
    [self.allPathArray addObject:image];
    // 重绘
    [self setNeedsDisplay];
}

#pragma mark --------------------
#pragma mark - 画板方法
// 清屏
-(void)clear{
    // 清空所有的路径
    [self.allPathArray removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}
// 撤销
-(void)undo{
    // 删除最后一个路径
    if (self.allPathArray.count) {
        [self.allPathArray removeLastObject];
        
        // 设置最后一条路径色颜色和线宽
//        LZMyBezierPath *path = [self.allPathArray lastObject];
//        self.color = path.color;
//        self.width = path.lineWidth;
        
        
        [self setNeedsDisplay];
    }
    
}
// 橡皮擦
-(void)erase{
    [self setLineColor:[UIColor whiteColor]];
}
// 设置线的宽度
-(void)setLineWidth:(CGFloat)lineWidth{
    self.width = lineWidth;
}
// 设置线的颜色
-(void)setLineColor:(UIColor *)lineColor{
    self.color = lineColor;
}

@end
