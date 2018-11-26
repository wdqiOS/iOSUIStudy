//
//  LZVCView.m
//  倒影
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZVCView.h"

@implementation LZVCView

// 返回当前UIView内部layer类型
+(Class)layerClass{
    return [CAReplicatorLayer class];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
