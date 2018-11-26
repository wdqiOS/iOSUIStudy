//
//  LZDragerViewController.m
//  抽屉效果
//
//  Created by 汪大强 on 2018/11/18.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDragerViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

@interface LZDragerViewController ()


@end

@implementation LZDragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 添加子控件
    [self setUp];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:pan];
    
    // 给控制器view添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
}
#pragma mark --------------------
#pragma mark - 点按手势
-(void)tap:(UITapGestureRecognizer *)tap{
    // 让mainV复位
    [UIView animateWithDuration:0.5 animations:^{
        self.mainV.frame = self.view.bounds;
    }];
}

#pragma mark --------------------
#pragma mark - 拖动手势
#define targetR 275
#define targetL -275
-(void)pan:(UIPanGestureRecognizer *)pan{
    // 获取偏移量(相对于原点)
    CGPoint transP = [pan translationInView:self.mainV];
    // 为什么不使用transform,是因为我们还要去修改高度，使用transform，只能修改x，y
    
//    self.mainV.transform = CGAffineTransformTranslate(self.mainV.transform, transP.x, 0);
//    // 需要复位
//    [pan setTranslation:CGPointZero inView:self.mainV];
    
    self.mainV.frame = [self frameWithOffsetX:transP.x];
    // 判断拖动的方向
    if (self.mainV.frame.origin.x > 0) { // 向右
        self.rightV.hidden = YES;
    }else if(self.mainV.frame.origin.x < 0){ // 向左
        self.rightV.hidden = NO;
    }
    
    // 当手指松开时，做自动定位
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        // 1. 判断在右侧
        // 当前view的x有没有大于屏幕宽度的一半，大于就是在右侧
        if (self.mainV.frame.origin.x > screenW * 0.5) {
            target = targetR;
        }else if(CGRectGetMaxX(self.mainV.frame) < screenW * 0.5){
            // 2. 判断在左侧
            // 当前view的最大的x有没有小于屏幕宽度的一半，小于就是在左侧
            target = targetL;
        }
        
        // 计算mainV的frame
        CGFloat offset = target - self.mainV.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            self.mainV.frame = [self frameWithOffsetX:offset];
        }];
      
    }
    
    // 需要复位
    [pan setTranslation:CGPointZero inView:self.mainV];
}

#define maxY 100
// 根据偏移量计算mainV的frame
-(CGRect)frameWithOffsetX:(CGFloat)offsetX{
    CGRect frame = self.mainV.frame;
    frame.origin.x += offsetX;
    
    // 当拖动的view的x值等于屏幕宽度时，maxY为最大，最大为100
    
    // 对计算的结果取绝对值
    frame.origin.y = fabs(frame.origin.x * maxY / [UIScreen mainScreen].bounds.size.width);
  
    // 屏幕的高度减去两倍的y值
    frame.size.height = [UIScreen mainScreen].bounds.size.height - 2 * frame.origin.y;
    
    return frame;
}

// 初始化界面
-(void)setUp{
    // leftV
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.frame];
    leftV.backgroundColor = UIColor.blueColor;
    [self.view addSubview:leftV];
//    self.leftV = leftV;
    _leftV = leftV;
    // rightV
    UIView *rightV = [[UIView alloc] initWithFrame:self.view.frame];
    rightV.backgroundColor = UIColor.greenColor;
    [self.view addSubview:rightV];
//    self.rightV = rightV;
    _rightV = rightV;
    // mainV
    UIView *mainV = [[UIView alloc] initWithFrame:self.view.frame];
    mainV.backgroundColor = UIColor.redColor;
    [self.view addSubview:mainV];
    // readonly修饰
//    self.mainV = mainV;
    _mainV = mainV;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
