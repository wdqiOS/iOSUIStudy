//
//  LZButton.m
//  调整UIButton内部子控件的位置
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZButton.h"

@implementation LZButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 改变图片的n内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

/*
 重写两个方法
 */
/*
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, 100, 70);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(100, 0, 70, 70);
}
*/

#pragma mark --------------------
#pragma mark - 方式二
-(void)layoutSubviews{
    [super layoutSubviews];
    // 设置子控件的位置
    self.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    self.imageView.frame = CGRectMake(100, 0, 70, 70);
}

@end
