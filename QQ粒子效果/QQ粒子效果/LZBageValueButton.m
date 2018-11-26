//
//  LZBageValueButton.m
//  QQ粒子效果
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZBageValueButton.h"

@interface LZBageValueButton ()

/** 小圆 */
@property(nonatomic, weak) UIView *smallCicle;

/** 形状图层 */
@property(nonatomic, weak) CAShapeLayer *shapL;



@end

@implementation LZBageValueButton

-(CAShapeLayer *)shapL{
    if (_shapL == nil) {
        // 形状图层
        CAShapeLayer *shapL = [CAShapeLayer layer];
        self.shapL = shapL;
        shapL.fillColor = UIColor.redColor.CGColor;
        [self.superview.layer insertSublayer:shapL atIndex:0];
    }
    return _shapL;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}


#pragma mark --------------------
#pragma mark - 拖动手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    // 拖动
    CGPoint transP = [pan translationInView:self];
    // transform,transform并没有修改center，它修改的是frame
//    self.transform = CGAffineTransformTranslate(self.transform, transP.x, transP.y);
//
    CGPoint center = self.center;
    center.x += transP.x;
    center.y += transP.y;
    self.center = center;
    // 复位
    [pan setTranslation:CGPointZero inView:self];
    
    
    
    CGFloat distance = [self distanceWithSmallCircle:self.smallCicle bigCircle:self];
    // 让小圆半径根据距离的增大，半径在减小
    CGFloat smallR = self.bounds.size.width * 0.5;
    smallR -= distance / 10.0;
    self.smallCicle.bounds = CGRectMake(0, 0, smallR * 2, smallR * 2);
    self.smallCicle.layer.cornerRadius = smallR;
    
    
    UIBezierPath *path = [self pathWithSmallCircle:self.smallCicle bigCircle:self];
    // 形状图层
    if (self.smallCicle.hidden == false) {
       self.shapL.path = path.CGPath;
    }
    if (distance > 60) {
        // 让小圆隐藏，让路径隐藏
        self.smallCicle.hidden = true;
        [self.shapL removeFromSuperlayer];
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        // 判断距离是否大于60
        // 大于60让按钮消失
        if (distance < 60) {
            // 小于60，复位
            [self.shapL removeFromSuperlayer];
            self.center = self.smallCicle.center;
            self.smallCicle.hidden = false;
        }else{
            // 播放一个动画消失
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
            NSMutableArray *imageArray = [NSMutableArray array];
            for (int i = 0; i < 8; i++) {
                UIImage *image =  [UIImage imageNamed:[NSString stringWithFormat:@"%d", i +1]];
                [imageArray addObject:image];
            }
            imageV.animationImages = imageArray;
            imageV.animationDuration = 1;
            [imageV startAnimating];
            [self addSubview:imageV];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
            
        }
    }
    
    
    
}

// 给定两个圆，描述一个不规则路径
-(UIBezierPath *)pathWithSmallCircle:(UIView *)smallCircle bigCircle:(UIView *)bigCircle{
    
    CGFloat x1 = smallCircle.center.x;
    CGFloat y1 = smallCircle.center.y;
    
    CGFloat x2 = bigCircle.center.x;
    CGFloat y2 = bigCircle.center.y;
    
    CGFloat d = [self distanceWithSmallCircle:smallCircle bigCircle:bigCircle];
    
    if (d <= 0) {
        return nil;
    }
    
    CGFloat cosΘ = (y2 - y1) / d;
    CGFloat sinΘ = (x2 - x1) / d;
    
    CGFloat r1 = smallCircle.bounds.size.width * 0.5;
    CGFloat r2 = bigCircle.bounds.size.width * 0.5;
    
    // 描述点
    // A点
    CGPoint pointA = CGPointMake(x1 - r1 * cosΘ, y1 + r1 * sinΘ);
    CGPoint pointB = CGPointMake(x1 + r1 * cosΘ, y1 - r1 * sinΘ);
    CGPoint pointC = CGPointMake(x2 + r2 * cosΘ, y2 - r2 * sinΘ);
    CGPoint pointD = CGPointMake(x2 - r2 * cosΘ, y2 + r2 * sinΘ);
    CGPoint pointO = CGPointMake(pointA.x + d * 0.5 * sinΘ, pointA.y + d * 0.5 * cosΘ);
    CGPoint pointP = CGPointMake(pointB.x + d * 0.5 * sinΘ, pointB.y + d * 0.5 * cosΘ);
    
    // 描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // AB
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    // BC(曲线)
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    // CD
    [path addLineToPoint:pointD];
    // DA(曲线)
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    
    
    
    return path;
    
}


-(void)setUp{
    // 圆角
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    // 设置背景颜色
    [self setBackgroundColor:[UIColor redColor]];
    // 设置字体
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    // 添加小圆
    UIView *smallCicle = [[UIView alloc] initWithFrame:self.frame];
    smallCicle.layer.cornerRadius = self.layer.cornerRadius;
    smallCicle.backgroundColor = self.backgroundColor;
    // 把UIView添加到指定的位置
    [self.superview insertSubview:smallCicle belowSubview:self];
    self.smallCicle = smallCicle;
    
}

// 求两个圆之间的距离
-(CGFloat)distanceWithSmallCircle:(UIView *)smallCircle bigCircle:(UIView *)bigCircle{
    // x轴方向的偏移量
    CGFloat offsetX = bigCircle.center.x - smallCircle.center.x;
    // y轴方向的偏移量
    CGFloat offsetY = bigCircle.center.y - smallCircle.center.y;
    
    return sqrt(offsetX * offsetX + offsetY * offsetY);
}

// 取消高亮状态
-(void)setHighlighted:(BOOL)highlighted{
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
