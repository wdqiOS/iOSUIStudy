//
//  LZHandleImageView.m
//  画板
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZHandleImageView.h"

@interface LZHandleImageView ()<UIGestureRecognizerDelegate>

/** imageView */
@property(nonatomic, weak) UIImageView *imageV;

@end

@implementation LZHandleImageView

-(UIImageView *)imageV{
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        _imageV = imageV;
        imageV.userInteractionEnabled = YES;
        imageV.frame = self.bounds;
        [self addSubview:imageV];
        self.clipsToBounds = true;
        
        // 添加手势
        [self addGesture];
    }
    return _imageV;
}

#pragma mark --------------------
#pragma mark - 添加手势
-(void)addGesture{
    // 添加拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
    
    // 添加捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageV addGestureRecognizer:pinch];
    
    // 添加旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [self.imageV addGestureRecognizer:rotation];
    
    // 添加长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longPress:)];
    [self.imageV addGestureRecognizer:longPress];
}

#pragma mark --------------------
#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return true;
}

#pragma mark --------------------
#pragma mark - 手势方法
-(void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint transP = [pan translationInView:self.imageV];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    // 复位
    [pan setTranslation:CGPointZero inView:self.imageV];
}

-(void)pinch:(UIPinchGestureRecognizer *)pinch{
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    // 复位
    [pinch setScale:1];
}

-(void)rotation:(UIRotationGestureRecognizer *)rotation{
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    // 复位
    [rotation setRotation:0];
}
-(void)longPress:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) { // 开始长按
        [UIView animateWithDuration:0.25 animations:^{
            // 设置为透明
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.imageV.alpha = 1;
            } completion:^(BOOL finished) {
                // 把当前的view做一个截屏
                // 开启位图
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                // 获取上下文
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctx];
                
                // 获取新图片
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                // 关闭上下文
                UIGraphicsEndImageContext();
                
                // 调用代理方法
                if ([self.delegate respondsToSelector:@selector(handleImageView:newImage:)]) {
                    [self.delegate handleImageView:self newImage:newImage];
                }
                
                // 从父控件中移除
                [self removeFromSuperview];
                
            }];
        }];
        
    }
}

-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageV.image = image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
