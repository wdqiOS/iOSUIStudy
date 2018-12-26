//
//  LZCover.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCover.h"

@implementation LZCover

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
}

+(void)show{
    // 1. 创建蒙版
    LZCover *cover = [[LZCover alloc] init];
    
    // 2. 添加蒙版
    // 蒙版添加到哪里
    // 添加到窗口上面
    [LZKeyWindow addSubview:cover];
    
    // 3. 设置尺寸
    cover.frame = [UIScreen mainScreen].bounds;
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
    
    
    // 父控件透明子控件也透明
//    cover.alpha = 0.7f;
    
    // 4. 添加popMenu 如果在蒙版添加，耦合度太高
//    UIView *popMenu = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [cover addSubview:popMenu];
//    popMenu.backgroundColor = [UIColor yellowColor];
    
}

+(void)hide{
    // 隐藏蒙版
    for (UIView *view in LZKeyWindow.subviews) {
        if ([view isKindOfClass:[LZCover class]]) {
            [view removeFromSuperview];
            break;
        }
    }
}

@end
