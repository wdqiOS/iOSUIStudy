//
//  LZImageView.m
//  事件的传递
//
//  Created by 汪大强 on 2018/11/16.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZImageView.h"
#import "LZButton.h"

@implementation LZImageView

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s", __func__);
    
    LZButton *btn = [LZButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(20, 20, 50, 50);
    [self addSubview:btn];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
