//
//  LZWheelButton.m
//  转盘
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWheelButton.h"

@implementation LZWheelButton

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    // 判断区域
//    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5);
//
//    if (CGRectContainsPoint(rect, point)) {
//        // 在指定的范围内
//        return [super hitTest:point withEvent:event];
//    }
//    return nil;
//}


// 判断是否可以响应点击
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    // 判断区域
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5);
    if (CGRectContainsPoint(rect, point)) {
        // 在指定的范围内
        return true;
    }
    return false;
}

// 返回当前按钮当中图片的位置尺寸
// contentRect当前按钮的位置尺寸
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
   
    CGFloat w = 40;
    CGFloat h = 48;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;
    return CGRectMake(x, y, w, h);
}

// 放回当前按钮当中label的位置尺寸
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    
//}

// 取消按钮高亮状态下做的事
-(void)setHighlighted:(BOOL)highlighted{
    // 去掉系统
//    [super setHighlighted:highlighted];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
