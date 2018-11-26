//
//  LZButton.m
//  事件的传递
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZButton.h"

@implementation LZButton

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGRectContainsPoint(CGRectMake(0, 0, 100, 100), point)) {
        return true;
    }
    return true;
}

@end
