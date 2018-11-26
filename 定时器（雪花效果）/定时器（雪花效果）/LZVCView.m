//
//  LZVCView.m
//  定时器（雪花效果）
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZVCView.h"

@implementation LZVCView

-(void)awakeFromNib{
    [super awakeFromNib];
    // 添加定时器
//    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeY) userInfo:nil repeats:true];
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeY)];
    // 想要CADisplayLink工作，必须得要把它添加到主运行循环当中
    // 隔多长长时间刷新：当每一次屏幕刷新的时候，就会调用指定的方法（屏幕每一秒刷新60次）
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // setNeedsDisplay会调用drawRect:，但是它并不是立马调用，只是设了一个标志，当下一次屏幕刷新的时候才去调用drawRect:
}

#pragma mark --------------------
#pragma mark - 定时器方法
-(void)changeY{
    NSLog(@"%s", __func__);
    _snowY += 10;
    if (_snowY > [UIScreen mainScreen].bounds.size.height) {
        _snowY = 0;
    }
    // 重绘
    [self setNeedsDisplay];
}

static int _snowY = 0;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
}


@end
