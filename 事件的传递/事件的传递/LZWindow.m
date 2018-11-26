//
//  LZWindow.m
//  事件的传递
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWindow.h"

@implementation LZWindow


// 作用：去寻找最适合的view
// 什么时候调用：当一个事件传递给当前view时，就会调用.
// 返回值：返回的是谁，谁就是最适合的view（就会调用最适合的view的touch方法）
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *fitView = [super hitTest:point withEvent:event];
////    NSLog(@"fitView === %@", fitView);
//    // 不管点击谁都返回白色view
////    return self.subviews[0];
//    // 会调用pointInside方法
//    return fitView;
    
    
    
    // 1. 判断自己能否接受事件
    if(self.userInteractionEnabled == NO || self.hidden == true || self.alpha <= 0.01)
    {
        return  nil;
    }
    // 2. 判断当前点在不在当前view
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    // 3. 从后往前遍历自己的子控件，让子控件重复前2步操作（把事件传递给子控件，让子控件调用hitTest）
    // 自己实现hitTest
    int count = (int)self.subviews.count;
    for (int i = count - 1; i >= 0; i--) {
        // 取出每一个子控件
        UIView *childView = self.subviews[i];
        // 把当前的点转换成子控件坐标系的点
        CGPoint childPoint = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        // 判断有没有找到最适合的view
        if (fitView) {
            return fitView;
        }
        
    }
    
    // 没有找到比他自己更适合的view
    
    return self;
}

// 作用：判断当前点在不在它调用view上，（谁调用pointInside，这个view就是谁）
// 什么时候调用：它是在hitTest方法当中调用的
// 注意：point点必须得跟它方法调用者在同一个坐标系里
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return true;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
