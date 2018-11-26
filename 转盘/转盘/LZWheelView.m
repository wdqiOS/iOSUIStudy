//
//  LZWheelView.m
//  转盘
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWheelView.h"
#import "LZWheelButton.h"

#define angle2Rad(angle) ((angle)/180.0 * M_PI)

@interface LZWheelView ()<CAAnimationDelegate>
//
@property (weak, nonatomic) IBOutlet UIImageView *contentV;

/** 当前选中的按钮 */
@property(nonatomic, weak) LZWheelButton *selectedButton;

/** CADisplayLink */
@property(nonatomic, strong) CADisplayLink *link;


@end

@implementation LZWheelView

-(CADisplayLink *)link{
    if (_link == nil) {
        // 添加定时器，保持一直旋转
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}


+(instancetype)wheelView{
   return [[[NSBundle mainBundle] loadNibNamed:@"LZWheelView" owner:nil options:nil] lastObject];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LZWheelView" owner:nil options:nil] lastObject];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.contentV.userInteractionEnabled = true;
    
    // 添加转盘按钮
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    CGFloat angle = 0;
    
    // 加载原始大图
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    // 加载原始选中大图
    UIImage *oriSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat clipW = oriImage.size.width / 12.0 * [UIScreen mainScreen].scale;
    CGFloat clipH = oriImage.size.height * [UIScreen mainScreen].scale;
    
    
    
    for (int i = 0; i < 12; i++) {
        LZWheelButton *btn = [LZWheelButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        
        
        
        // 设置按钮选中状态下的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        // 设置按钮正常状态下显示的图片
        // 给定一张图片，截取指定区域范围内的图片
        X = i * clipW;
        // CGImageCreateWithImageInRect，使用的坐标都是以像素点（固定不变），
        // 在iOS当中使用的都是点坐标（随着屏幕分辨率变化）
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, CGRectMake(X, Y, clipW, clipH));
        [btn setImage:[UIImage imageWithCGImage:clipImage] forState:UIControlStateNormal];
        // 设置按钮选中状态下的图片
        CGImageRef clipSelImage = CGImageCreateWithImageInRect(oriSelImage.CGImage, CGRectMake(X, Y, clipW, clipH));
        [btn setImage:[UIImage imageWithCGImage:clipSelImage] forState:UIControlStateSelected];
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        
        // 让每一个按钮在上一个基础上面旋转30
        btn.transform = CGAffineTransformMakeRotation(angle2Rad(angle));
        angle += 30;
        
        [self.contentV addSubview:btn];
        
        // 默认第一个按钮成为选中状态
        if (0 == i) {
            [self btnClick:btn];
        }
    }
}

#pragma mark --------------------
#pragma mark - 按钮的点击事件
-(void)btnClick:(LZWheelButton *)btn{
    // 当前点击的按钮设置为选中状态

    
    // 1. 当前选中的按钮取消选中
    self.selectedButton.selected = false;
    // 2. 当前点击的按钮成为选中状态
    btn.selected = true;
    // 3. 当前点击的按钮成为选中状态
    self.selectedButton = btn;
}

-(void)rotation{
    
    // 开始旋转
    self.link.paused = false;
    
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI * 3);
//    anim.repeatCount = MAXFLOAT;
//    anim.duration = 1;
//    [self.contentV.layer addAnimation:anim forKey:nil];
}

#pragma mark --------------------
#pragma mark - CADisplayLink旋转
-(void)update:(CADisplayLink *)link{
    self.contentV.transform = CGAffineTransformRotate(self.contentV.transform, M_PI/300.0);
}

-(void)stop{
    self.link.paused = true;
}
// 开始选号
- (IBAction)startChoose:(UIButton *)sender {
    // 1. 让转盘快速的旋转几圈，当前选中的按钮指向最上方
        CABasicAnimation *anim = [CABasicAnimation animation];
        anim.keyPath = @"transform.rotation";
        anim.toValue = @(M_PI * 4);
//        anim.repeatCount = 4;
        anim.duration = 0.5;
        anim.delegate = self;
        [self.contentV.layer addAnimation:anim forKey:nil];
    // 动画结束时当前选中的按钮指向最上方
    
}

// 非正式协议
// 给一个类添加一个分类的形式

// 当动画结束时调用
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if(flag == true){
        // 让当前选中的按钮的父控件倒着旋转回去
        // 获取当前选中按钮旋转的角度
        CGAffineTransform transform = self.selectedButton.transform;
        // 通过transform获取当前旋转的度数
        CGFloat angle = atan2(transform.b, transform.a);
        self.contentV.transform = CGAffineTransformMakeRotation(-angle);
        
        // 移除所用动画
        [self.contentV.layer removeAllAnimations];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
