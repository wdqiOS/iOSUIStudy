//
//  LZDrawView.m
//  UIKit绘图
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDrawView.h"

@implementation LZDrawView

-(void)awakeFromNib{
    [super awakeFromNib];
    
//    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawImage:rect];
}

#pragma mark --------------------
#pragma mark - 绘制图片
-(void)drawImage:(CGRect)rect{
    // 画图片
    UIImage *image = [UIImage imageNamed:@"2"];
    // drawAtPoint:绘制的是原始图片的大小
//    [image drawAtPoint:CGPointZero];
    
    // drawInRect: 把绘制的图片给填充到给定的区域当中
//    [image drawInRect:rect];
    
    // 裁剪(超过裁剪区域以外的内容，都会被自动裁减掉)
    // 设置裁剪区域一定要在绘制之前进行设置
//    UIRectClip(CGRectMake(0, 0, 50, 50));
//    // 平铺
//    [image drawAsPatternInRect:rect];
    
    // 另外一种的画法：底层都需要： 1.获取上下文 --> 2. 设置路径； --> 3. 将路径添加到上下文；4. 将上下文内容渲染到view上;
    UIRectFill(CGRectMake(50, 50, 50, 50));
}

#pragma mark --------------------
#pragma mark - 绘制文字
-(void)drawText:(CGRect)rect{
    // 绘制的文字
    NSString *str = @"李哲我爱你李哲我爱你李哲我爱你李哲我爱你李哲我爱你李哲我爱你李哲我爱你";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    // 字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    // 设置颜色(字体颜色)
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    // 背景色
    //    dict[NSBackgroundColorAttributeName] = [UIColor blueColor];
    // 设置描边
    //    dict[NSStrokeColorAttributeName] = [UIColor whiteColor];
    dict[NSStrokeWidthAttributeName] = @2;
    // 设置阴影
    NSShadow *shaw = [[NSShadow alloc] init];
    shaw.shadowColor = [UIColor greenColor];
    // 设置阴影的偏移量
    shaw.shadowOffset = CGSizeMake(10, 10);
    shaw.shadowBlurRadius = 2;
    dict[NSShadowAttributeName] = shaw;
    
    
    // 用drawInRect: 会自动换行，用drawAtPoint: 不会自动换行
    //    [str drawAtPoint:CGPointZero withAttributes:dict];
    [str drawInRect:rect withAttributes:dict];
}


@end
