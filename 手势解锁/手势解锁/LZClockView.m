//
//  LZClockView.m
//  手势解锁
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZClockView.h"

@interface LZClockView ()

/** 存放当前选中的按钮 */
@property(nonatomic, strong) NSMutableArray *selectBtnArray;

/** 当前手指所在的点 */
@property(nonatomic, assign) CGPoint curP;

@end



@implementation LZClockView

/** 懒加载存放当前选中的按钮的数组 */
-(NSMutableArray *)selectBtnArray{
    if (_selectBtnArray == nil) {
        _selectBtnArray = [NSMutableArray array];
    }
    return _selectBtnArray;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    // 初始化界面
    [self setUp];
}

#pragma mark --------------------
#pragma mark - 搭建界面添加按钮
-(void)setUp{
    for (int i = 0; i < 9; i++) {
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.userInteractionEnabled = false;
        
        btn.tag = i;
        
        // 设置按钮的图片
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        // 计算frame
        
        
        [self addSubview:btn];
        
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // 取出每一个按钮，设置按钮的frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat btnWH = 74;
    
    // 总共有多少列
    int column = 3;
    CGFloat margin = (self.bounds.size.width - (btnWH * column)) / (column + 1);
    int curC = 0;
    int curR = 0;
    for (int i = 0; i < self.subviews.count; i++) {
        // 当前所在的列
        curC = i % column;
        // 当前所在的行
        curR = i / column;
       
        x = margin + curC * (margin + btnWH);
        y = margin + curR * (margin + btnWH);
        
        // 取出每一个按钮
        UIButton *btn = self.subviews[i];
        // 设置按钮的frame
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
        
    }
}

#pragma mark --------------------
#pragma mark - 获取当前手指的点
-(CGPoint)getCurrentPoint:(NSSet *)touches{
    // 当前手指所在的点在不在按钮上，如果在，让按钮成为选中状态
    // 1. 获取当前手指所在的点
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    return curP;
}

// 给定一个点，判断给定的点在不在按钮身上
// 如果在按钮身上，返回当前所在的按钮；如果不在，返回nil
-(UIButton *)btnRectContainsPoint:(CGPoint)point{
    // 2. 判断curP在不在按钮身上
    // 取出所有的按钮进行判断
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) { // 表示在
            return btn;
        }
    }
    return nil;
}

#pragma mark --------------------
#pragma mark - touch方法
// 手势开始点击
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 当前手指所在的点在不在按钮上，如果在，让按钮成为选中状态
    // 1. 获取当前手指所在的点
//    UITouch *touch = touches.anyObject;
//    CGPoint curP = [touch locationInView:self];
    CGPoint curP = [self getCurrentPoint:touches];
    // 2. 判断curP在不在按钮身上
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn && btn.selected == false) {
        btn.selected = true;
        // 保存当前选中的按钮
        [self.selectBtnArray addObject:btn];
    }
}

// 手指移动时调用
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 当前手指所在的点在不在按钮上，如果在，让按钮成为选中状态
    // 1. 获取当前手指所在的点
    CGPoint curP = [self getCurrentPoint:touches];
    // 记录当前手指所在的点
    self.curP = curP;
//    UITouch *touch = touches.anyObject;
//    CGPoint curP = [touch locationInView:self];
    // 2. 判断curP在不在按钮身上
    UIButton *btn = [self btnRectContainsPoint:curP];
    if (btn && btn.selected == false) {
        btn.selected = true;
        // 保存当前选中的按钮
        [self.selectBtnArray addObject:btn];
        
       
    }
    
    // 重绘
    [self setNeedsDisplay];
    
}

// 手指离开时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSMutableString *str = [NSMutableString string];
    // 1. 取消所有选中的按钮
    for (UIButton *btn in self.selectBtnArray) {
        btn.selected = NO;
        [str appendFormat:@"%ld", btn.tag];
    }
    
    // 2. 清空路径
    [self.selectBtnArray removeAllObjects];
    [self setNeedsDisplay];
    // 3. 查看当前按选中的顺序
    // 查看是否是第一次设置密码
    NSString *keyPwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"keyPwd"];
    if (!keyPwd) {
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"keyPwd"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"第一次输入密码");
    }else{
        if ([keyPwd isEqualToString:str]) { // 表示密码正确
            UIAlertController *alerC = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"密码正确");
            }];
            [alerC addAction:action];
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alerC animated:true completion:nil];
        }else{
            UIAlertController *alerC = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"密码正确");
            }];
            [alerC addAction:action];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alerC animated:true completion:nil];
        }
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (self.selectBtnArray.count) {
        
        // 1. 创建路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        // 2. 取出所有保存的选中按钮
        for (int i = 0; i < self.selectBtnArray.count; i++) {
            // 取出每一个按钮
            UIButton *btn = self.selectBtnArray[i];
            // 判断当前按钮是不是第一个按钮
            // 如果是，设置成路径的起点
            if (0 == i) { // 表示第一个
                [path moveToPoint:btn.center];
            }else{
                [path addLineToPoint:btn.center];
            }
        }
        
        // 添加一个线到当前手指所在的点
        [path addLineToPoint:self.curP];
        
        // 设置路径的状态
        [path setLineWidth:10];
        [[UIColor redColor] set];
        [path setLineJoinStyle:kCGLineJoinRound];
        
        // 3. 开始绘制路径
        [path stroke];
        
    }
    
    
}


@end
