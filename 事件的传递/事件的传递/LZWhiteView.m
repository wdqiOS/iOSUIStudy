//
//  LZWhiteView.m
//  事件的传递
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWhiteView.h"

@implementation LZWhiteView

// 作用：去寻找最适合的view
// 什么时候调用：当一个事件传递给当前view时，就会调用.
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *fitView = [super hitTest:point withEvent:event];
    return fitView;
//    return self.subviews[0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
