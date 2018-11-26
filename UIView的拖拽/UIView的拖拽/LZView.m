//
//  LZView.m
//  UIView的拖拽
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZView.h"

@implementation LZView

// iPhone开发中，要避免使用双击事件！！！！

/*
 如果父控件不能接收触摸事件，那么子控件就不可能接收到触摸事件
 提示：UIImageView的userInteractionEnabled默认就是NO，因此UIImageView及它的子控件是不能接收触摸事件的
    不能接收触摸事件的情况：
    1. userInteractionEnabled = NO
    2. hidden = YES;
    3. alpha = 0.0 ~ 0.01;
 */


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

// 触摸时开始移动时调用（移动时会持续调用）
// NSSet: 无序
// NSArray: 有序
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
//    NSLog(@"targetView === %@", touches.anyObject);
    // 做UIView拖拽
    
    UITouch *touch = [touches anyObject];
    
    // 求偏移量 = 手指当前点的X - 手指上一个点的X
    CGPoint cuP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    NSLog(@"cup === %@", NSStringFromCGPoint(cuP));
    NSLog(@"prep ==== %@", NSStringFromCGPoint(preP));
    CGFloat offsetX = cuP.x - preP.x;
    CGFloat offsetY = cuP.y - preP.y;
    // 平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
}

// 当手指离开屏幕时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

// 当发生系统事件时就会调用该方法（电话打入、自动关机）
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
