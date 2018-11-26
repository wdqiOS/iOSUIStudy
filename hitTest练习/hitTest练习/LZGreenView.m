//
//  LZGreenView.m
//  hitTest练习
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZGreenView.h"

@interface LZGreenView ()

@property(nonatomic, weak) IBOutlet UIButton *btn;

@end

@implementation LZGreenView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *fitView = [super hitTest:point withEvent:event];
//    NSLog(@"%@ -----", fitView);
    // 拿到后面的按钮
//    NSLog(@"btn === %@", self.btn);
//    return self.btn;
    
    // 当点在按钮上的时候才返回按钮，如果不在按钮上，保持系统的默认做法
    // 判断点在不在按钮身上
    // 把当前点转换到按钮身上的坐标系的点
   CGPoint btnP = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:btnP withEvent:event]) { // 在按钮身上
        return self.btn;
    }
    
    return [super hitTest:point withEvent:event];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
