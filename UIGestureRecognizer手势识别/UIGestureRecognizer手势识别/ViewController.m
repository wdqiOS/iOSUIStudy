//
//  ViewController.m
//  UIGestureRecognizer手势识别
//
//  Created by 汪大强 on 2018/11/18.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpRotation];
    [self setUpPin];
    
}

// 六. 捏合手势
-(void)setUpPin{
    // 1.创建手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    // 2.添加手势
    [self.imageV addGestureRecognizer:pinch];
}

#pragma mark --------------------
#pragma mark - 捏合手势
-(void)pinch:(UIPinchGestureRecognizer *)pin{
    NSLog(@"%s", __func__);
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, pin.scale, pin.scale);
    // 复位
    [pin setScale:1];
//    self.imageV.transform = CGAffineTransformMakeScale(pin.scale, pin.scale);
}

// 五. 旋转手势
-(void)setUpRotation{
    // 1.创建手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    // 2.添加手势
    [self.imageV addGestureRecognizer:rotation];
}

#pragma mark --------------------
#pragma mark - 旋转手势
-(void)rotation:(UIRotationGestureRecognizer *)rotation{
    NSLog(@"%s", __func__);
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, rotation.rotation);
    // 复位
    [rotation setRotation:0];
    
//    self.imageV.transform = CGAffineTransformMakeRotation(rotation.rotation);
}

// 四. 拖动手势
-(void)setUpPan{
    // 1. 创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    // 2. 添加手势
    [self.imageV addGestureRecognizer:pan];
}

#pragma mark --------------------
#pragma mark - 拖动手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    NSLog(@"%s", __func__);
    // 计算偏移量(相对于最原始的偏移量)
    CGPoint transP = [pan translationInView:self.imageV];
    // 让它相对于上一次
    // 复位
    [pan setTranslation:CGPointZero inView:self.imageV];
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, transP.x, transP.y);
//    self.imageV.transform = CGAffineTransformMakeTranslation(transP.x, transP.y);
    
}

// 三. 轻扫手势
-(void)setUpSwipe{
    // 1、创建手势
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    // 设置轻扫方向（一个轻扫手势只能对应一个方向）
    swipe1.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    // 设置轻扫方向（一个轻扫手势只能对应一个方向）
    swipe2.direction = UISwipeGestureRecognizerDirectionRight;
    
    // 2. 添加手势
    [self.imageV addGestureRecognizer:swipe1];
    [self.imageV addGestureRecognizer:swipe2];
    
    
}

#pragma mark --------------------
#pragma mark - 滑动手势
// 默认从左往右滑动
-(void)swipe:(UISwipeGestureRecognizer *)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"left");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"right");
    }
}

// 二. 长按手势
-(void)setUpLongTap{
    // 1. 创建手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    // 2. 添加手势
    [self.imageV addGestureRecognizer:longP];
}

#pragma mark --------------------
#pragma mark - 长按手势
// 当长按移动时，该方法会持续调用
-(void)longP:(UILongPressGestureRecognizer *)longP{
    NSLog(@"%s", __func__);
    // 判断手势的状态
    if (longP.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始长按");
    }else if(longP.state == UIGestureRecognizerStateChanged){
        NSLog(@"长按时移动");
    }else if (longP.state == UIGestureRecognizerStateEnded){
        NSLog(@"长按结束");
    }
}

// 一. 点按手势
-(void)setUpTap{
    // 1. 创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    tap.delegate = self;
    // 2. 添加手势
    [self.imageV addGestureRecognizer:tap];
}

#pragma mark --------------------
#pragma mark - 点击手势
// 3. 实现手势方法
-(void)tap{
    NSLog(@"%s", __func__);
}

#pragma mark --------------------
#pragma mark - UIGestureRecognizerDelegate
// 是否允许接收手指
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    // 让当前图片左边不能点击，右边能够点击
//    // 获取当前手指的点
//    CGPoint imageVP = [touch locationInView:self.imageV];
//    // 判断当前点是在左边还是右边
//    if (imageVP.x > self.imageV.frame.size.width * 0.5) {
//        // 右边
//        return true;
//    }else{ // 左边
//        return false;
//    }
//}

// 是否允许同时支持多个手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    return true;
}



@end
