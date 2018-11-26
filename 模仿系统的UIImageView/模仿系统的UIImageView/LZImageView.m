//
//  LZImageView.m
//  模仿系统的UIImageView
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZImageView.h"

@implementation LZImageView

/** 重构方法 */
-(instancetype)initWithImage:(UIImage *)image{
    if(self = [super init]){
        // 确定当前imageview的尺寸大小
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickPic:)]) {
        [self.delegate clickPic:self];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.image drawInRect:rect];
}

-(void)setImage:(UIImage *)image{
    _image = image;
    // 重绘
    [self setNeedsDisplay];
}


@end
