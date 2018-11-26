//
//  ViewController.m
//  时钟
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

// 每一秒旋转的度数
#define perSecA 6
// 每一分旋转的度数
#define perMinA 6
// 每一小时旋转的度数
#define perHourA 30

// 每一分，时针旋转的度数
#define perMinHourA 30 / 60

#define angle2Rad(angle)    ((angle) / 180.0 * M_PI)

@interface ViewController ()
/** 钟表图片 */
@property (weak, nonatomic) IBOutlet UIImageView *colockView;

/** 当前秒针 */
@property(nonatomic, weak) CALayer *secL;

/** 当前分针 */
@property(nonatomic, weak) CALayer *minL;

/** 当前时针 */
@property(nonatomic, weak) CALayer *hourL;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 添加时针
    [self setHour];
    // 添加分针
    [self setMin];
    // 添加秒针
    [self setSeconds];
    
    // 添加圆点
    [self setPoint];
   
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerChange) userInfo:nil repeats:YES];
    [self timerChange];
}



// 每一秒调用一次
-(void)timerChange{
    // 获取当前是多少秒
    // 当前的日历
    NSCalendar *cal = [NSCalendar currentCalendar];
    // components: 日历的组件，年，月，日，时，分，秒
    // fromDate: 从什么时间开始获取
    NSDateComponents *cmp = [cal components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    // 获取多少秒
    NSInteger curSec = cmp.second;
    
    // 秒针开始旋转
    // 计算秒针当前旋转的角度
    // angle = 当前多少秒 * 每秒旋转多少度
    CGFloat secA = curSec * perSecA;
    self.secL.transform = CATransform3DMakeRotation(angle2Rad(secA), 0, 0, 1);
    
    // 分针开始旋转
    // 计算分针当前旋转的角度
    // angle = 当前多少分 * 每分旋转多少度
    CGFloat minA = cmp.minute * perMinA;
    self.minL.transform = CATransform3DMakeRotation(angle2Rad(minA), 0, 0, 1);
    
    // 时针开始旋转
    // 计算时针当前旋转的角度
    // angle = 当前多少小时 * 每小时旋转多少度
    CGFloat hourA = cmp.hour * perHourA + cmp.minute * perMinHourA;
    self.hourL.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1);
}

// 添加秒针
-(void)setSeconds{
    CALayer *secL = [CALayer layer];
    secL.bounds = CGRectMake(0, 0, 1, 90);
    secL.backgroundColor = [UIColor redColor].CGColor;
    
    secL.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    secL.anchorPoint = CGPointMake(0.5, 0.8);
    
    [self.colockView.layer addSublayer:secL];
    self.secL = secL;
    
}

// 添加分针
-(void)setMin{
    CALayer *minL = [CALayer layer];
    minL.bounds = CGRectMake(0, 0, 5, 70);
    minL.backgroundColor = [UIColor blackColor].CGColor;
    minL.anchorPoint = CGPointMake(0.5, 1);
    minL.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    minL.cornerRadius = minL.bounds.size.width * 0.5;
    [self.colockView.layer addSublayer:minL];
    self.minL = minL;
    
}

// 添加时针
-(void)setHour{
    CALayer *hourL = [CALayer layer];
    hourL.bounds = CGRectMake(0, 0, 5, 50);
    hourL.backgroundColor = [UIColor blackColor].CGColor;
    hourL.anchorPoint = CGPointMake(0.5, 1);
    hourL.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    hourL.cornerRadius = hourL.bounds.size.width * 0.5;
    [self.colockView.layer addSublayer:hourL];
    self.hourL = hourL;
}

// 添加圆点
-(void)setPoint{
    CALayer *blackP = [CALayer layer];
    blackP.backgroundColor = [UIColor blackColor].CGColor;
    blackP.bounds = CGRectMake(0, 0, 10, 10);
    blackP.cornerRadius = blackP.bounds.size.width * 0.5;
    blackP.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    [self.colockView.layer addSublayer:blackP];
    
    CALayer *redP = [CALayer layer];
    redP.backgroundColor = [UIColor redColor].CGColor;
    redP.bounds = CGRectMake(0, 0, 5, 5);
    redP.cornerRadius = redP.bounds.size.width * 0.5;
    redP.position = CGPointMake(self.colockView.bounds.size.width * 0.5, self.colockView.bounds.size.height * 0.5);
    [self.colockView.layer addSublayer:redP];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 所有的旋转、缩放都是绕着锚点进行的
//    self.secL.transform = CATransform3DMakeRotation(M_PI + M_PI_4, 0, 0, 1);
}


@end
