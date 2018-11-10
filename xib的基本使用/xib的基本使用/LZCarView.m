//
//  LZCarView.m
//  xib的基本使用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZCarView.h"

@implementation LZCarView

/*
 子控件初始化
 */
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 创建图片的UIImageView对象
        // 创建标题的对象（UILabel）
        // 创建子标题（UILabel）
        // 创建跟帖对象（UILabel）
        
    }
    return self;
}

/**
 对子控件进行布局
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 对子控件进行布局
}

// 重写模型carset方法，赋值
-(void)setCar:(LZCar *)car{
    _car = car;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
