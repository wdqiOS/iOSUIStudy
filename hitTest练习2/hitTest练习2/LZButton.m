//
//  LZButton.m
//  hitTest练习2
//
//  Created by 汪大强 on 2018/11/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZButton.h"

@implementation LZButton

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.btn) {
//        return self.btn;
        // 判断当前点在不在btn身上
        
        // 把当前点转换成btn身上的点
        CGPoint btnP = [self convertPoint:point toView:self.btn];
        if ([self.btn pointInside:btnP withEvent:event]) {
            return self.btn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    return [super hitTest:point withEvent:event];
}



// 移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 1. 获取UITouch对象
    UITouch *touch = touches.anyObject;
    // 2. 获取当前手指的点，上一个手指的点
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    // 3. 计算偏移量
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    // 4. 偏移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
