//
//  LZCircleButton.m
//  购物车
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCircleButton.h"

@implementation LZCircleButton


-(void)awakeFromNib{
    [super awakeFromNib];
    // 设置边框宽度
    self.layer.borderWidth = 1.0;
    // 设置边框颜色
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    // 设置圆角半径
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}


@end
