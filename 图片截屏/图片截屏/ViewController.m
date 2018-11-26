//
//  ViewController.m
//  图片截屏
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

/** 开始时手指的点 */
@property(nonatomic, assign) CGPoint startP;

/** 遮盖view */
@property(nonatomic, weak) UIView *coverV;

@end

@implementation ViewController


/**
 懒加载coverV
 1. 保证始终只有一份
 2. 什么时候用到什么时候才去加载
 @return 遮盖view对象
 */
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
    
    // 允许交互
    self.imageV.userInteractionEnabled = true;
}

#pragma mark --------------------
#pragma mark - 拖动
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    // 判断手势的状态
    CGPoint curP = [sender locationInView:self.imageV];
    
    if (sender.state == UIGestureRecognizerStateBegan) { // 开始状态
        self.startP = curP;
    }else if(sender.state == UIGestureRecognizerStateChanged){ // 拖动状态
        CGFloat x = self.startP.x;
        CGFloat y = self.startP.y;
        CGFloat w = curP.x - x;
        CGFloat h = curP.y - y;
        CGRect rect = CGRectMake(x, y, w, h);
        // 添加一个UIview
        self.coverV.frame = rect;
        
    }else if(sender.state == UIGestureRecognizerStateEnded){ // 结束拖拽
        // 把超过coverV的frame以外的内容裁减掉
        // 生成了一张图片把原来的图片替换掉
        // 1. 开启上下文
        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, YES, 0);
        
        // 把imageView绘制到上下文之前，设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverV.frame];
        [clipPath addClip];
        
        // 把当前的imageVi渲染到上下文当中
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.imageV.layer renderInContext:ctx];
        
        
        // 从上下文当中生成一张图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        // 移除遮盖
        [self.coverV removeFromSuperview];
        
        self.imageV.image = newImage;
        
        
        
    }
    
}



@end
