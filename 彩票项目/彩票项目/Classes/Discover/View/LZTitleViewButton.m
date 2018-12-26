//
//  LZTitleViewButton.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTitleViewButton.h"

@implementation LZTitleViewButton

// 调整子控件位置
// 调整imageview的位置
//-(CGRect)imageRectForContentRect:(CGRect)contentRect;
// 调整label的位置
//-(CGRect)titleRectForContentRect:(CGRect)contentRect;

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        // 代表第一次
        // 调整子控件的位置
        // 调整label
        self.titleLabel.x = self.imageView.x;
        // 调整imageview
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

// 重写设置title方法
-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

// 重写系统的方法需要先还原父类方法
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
