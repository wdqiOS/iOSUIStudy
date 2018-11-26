//
//  LZPopMenu.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//
#define LZKeyWindow [UIApplication sharedApplication].keyWindow

#import "LZPopMenu.h"
#import "LZCover.h"

@interface LZPopMenu ()

@end

@implementation LZPopMenu

#pragma mark --------------------
#pragma mark - 当点击x号按钮的时候调用
- (IBAction)close:(id)sender {

    
    // 通知外界点击了x号按钮
    if ([self.delegate respondsToSelector:@selector(popMenuDidCloseBtn:)]) {
        [self.delegate popMenuDidCloseBtn:self];
    }
}

+(instancetype)showIncenter:(CGPoint)center{
    // 加载xib
    UIView *popMenu = [[[NSBundle mainBundle] loadNibNamed:@"LZPopMenu" owner:nil options:nil] lastObject];
    popMenu.center = center;
    // 超出父控件剪切
//    popMenu.layer.masksToBounds = true;
//    popMenu.clipsToBounds = true;
    // 自动布局
    [LZKeyWindow addSubview:popMenu];
    return (LZPopMenu *)popMenu;
}


//-(void)hideInCenter:(CGPoint)center{
//    [self removeFromSuperview];
//}

-(void)hideInCenter:(CGPoint)center completion:(MyBlock)completion{
    // 点击x号按钮，popMenu慢慢缩小，
    // 边平移，缩小到一定尺寸，移除蒙版
    // 子控件可以超出父控件
    [UIView animateWithDuration:0.5f animations:^{
        //        self.frame = CGRectMake(0, 0, 0, 0);
        //        // 重绘
        //        [self setNeedsDisplay];
        self.center = CGPointMake(44, 44);
        
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        // 1. 移除自己
        [self removeFromSuperview];
        // 2. 移除蒙版 耦合度太高
        //        [LZCover hide];
        // 1. 用代理通知外界
        //        if ([self.delegate respondsToSelector:@selector(popMenuCloseAnimationDone:)]) {
        //            [self.delegate popMenuCloseAnimationDone:self];
        //        }
        // 2. 使用block
        // block当做参数传递时， 如果block值为空，直接调用崩溃
        if(completion){
            // 移除蒙版
            completion();
        }
        
    }];
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
