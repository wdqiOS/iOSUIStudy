//
//  LZShopviewBtn.m
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/29.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZShopviewBtn.h"
#import "LZShop.h"

@interface LZShopviewBtn ()

@end

@implementation LZShopviewBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 文本颜色
        [self setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // 1.获取自身的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    // 设置子控件的frame
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

-(void)setShop:(LZShop *)shop{
    _shop = shop;
    
    // 设置子控件的数据
    [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
//    self.imageView.image = [UIImage imageNamed:shop.icon];
    [self setTitle:shop.name forState:UIControlStateNormal];
}



@end
