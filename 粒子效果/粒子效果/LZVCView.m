//
//  LZVCView.m
//  粒子效果
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZVCView.h"

@interface LZVCView ()<CAAnimationDelegate>

/** 当前绘制的路径 */
@property(nonatomic, strong) UIBezierPath *path;

/** 当前粒子 */
@property(nonatomic, weak) CALayer *dotLayer;

@end

@implementation LZVCView

+(Class)layerClass{
    return [CAReplicatorLayer class];
}

// 开始动画
-(void)start{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 10;
    anim.delegate = self;

    [self.dotLayer addAnimation:anim forKey:nil];
}

// 动画已经开始
-(void)animationDidStart:(CAAnimation *)anim{
    [UIView animateWithDuration:0.5 animations:^{
        [self.path removeAllPoints];
        [self setNeedsDisplay];
    }];
    
}


// 重绘
-(void)redraw{
    // 删除动画
    [self.dotLayer removeAllAnimations];
    // 清除路径
    [self.path removeAllPoints];
    // 重绘
    [self setNeedsDisplay];
}


-(void)awakeFromNib{
    [super awakeFromNib];
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 添加粒子
    CALayer *dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(-10, 0, 10, 10);
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    dotLayer.backgroundColor = [UIColor colorWithRed:r / 255.0  green:g / 255.0 blue:b / 255.0 alpha:1].CGColor;
    dotLayer.cornerRadius = dotLayer.bounds.size.width * 0.5;
    [self.layer addSublayer:dotLayer];
    self.dotLayer = dotLayer;
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.layer;
    repL.instanceCount = 30;
    repL.instanceDelay = 0.3;
    repL.instanceColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
}



#pragma mark --------------------
#pragma mark - 拖动手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    
    // 获取当前点
    CGPoint curP = [pan locationInView:self];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        [self.path moveToPoint:curP];
        
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        // 添加一根线到当前点
        [self.path addLineToPoint:curP];
        // 重绘
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 绘制路径
    [self.path stroke];
}



@end
