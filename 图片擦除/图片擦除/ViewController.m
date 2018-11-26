//
//  ViewController.m
//  图片擦除
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

/** 遮盖view */
@property(nonatomic, weak) UIView *coverV;

@end

@implementation ViewController

#pragma mark --------------------
#pragma mark - 懒加载遮盖view
-(UIView *)coverV{
    if (_coverV == nil) {
        UIView *coverV = [[UIView alloc] init];
        coverV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        _coverV = coverV;
        [self.view addSubview:coverV];
    }
    return _coverV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
}

#pragma mark --------------------
#pragma mark - 拖动手势
-(void)pan:(UIGestureRecognizer *)sender{
    
    // 获取当前手指的点
    CGPoint curP = [sender locationInView:self.imageV];
    
   
    
    // 确定擦除区域
    CGFloat rectWH = 30;
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    self.coverV.frame = rect;
    
    // 生成一张带有透明的擦除区域的图片
    // 1. 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
    

    // 2. 把UIImageView内容渲染到当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageV.layer renderInContext:ctx];
    // 3. 擦除上下文当中的指定区域
    CGContextClearRect(ctx, rect);
   
    // 4. 从上下文当中取出新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭上下文
    UIGraphicsEndImageContext();
    
    // 6. 替换图片
    self.imageV.image = newImage;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.coverV removeFromSuperview];
    }
 
    
    
    
}


@end
