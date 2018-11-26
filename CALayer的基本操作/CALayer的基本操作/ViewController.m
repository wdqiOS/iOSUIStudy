//
//  ViewController.m
//  CALayer的基本操作
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 红色view */
@property (weak, nonatomic) IBOutlet UIView *redView;
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    // 3D效果
    [UIView animateWithDuration:0.5 animations:^{
//        self.imageV.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
        
        // 使用kvc赋值
        // 把结构体转成对象
        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
//        [self.imageV.layer setValue:value forKeyPath:@"transform"];
        // 通过kvc一般是做快速的旋转、平移、缩放
        // 缩放：transform.scale value值：@(1.2) 等
        // 平移：translation.x / translation.y value值：@(30) 等
        // 旋转：transform.rotation.x / transform.rotation.y / transform.rotation.z value值：@(M_PI)等
        [self.imageV.layer setValue:@(M_PI) forKeyPath:@"transform.rotation.z"];
        
    } completion:^(BOOL finished) {
        self.imageV.layer.transform = CATransform3DMakeRotation(0, 1, 1, 0);
    }];
    
    
}

#pragma mark --------------------
#pragma mark - UIImageView layer
-(void)UIImageViewLayer{
    // 设置阴影的颜色
    self.imageV.layer.shadowColor = [UIColor blueColor].CGColor;
    // 设置阴影的不透明度(0 ~ 1,默认为0)
    self.imageV.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.imageV.layer.shadowOffset = CGSizeMake(30, 30);
    // 设置阴影模糊的半径
    self.imageV.layer.shadowRadius = 5;
    
    // 添加边框
    // 边框宽度,往里走
    self.imageV.layer.borderWidth = 5;
    // 边框颜色
    self.imageV.layer.borderColor = [UIColor yellowColor].CGColor;
    
    // 设置圆角
    self.imageV.layer.cornerRadius = 50;
    // 把超过根层以外的东西都给裁减掉(UIView自带的层，我们称它是根层)
    self.imageV.layer.masksToBounds = true;
}


#pragma mark --------------------
#pragma mark - UIView layer
-(void)UIViewLayer{
    // 设置阴影的颜色
    self.redView.layer.shadowColor = [UIColor blueColor].CGColor;
    // 设置阴影的不透明度(0 ~ 1,默认为0)
    self.redView.layer.shadowOpacity = 1;
    // 设置阴影的偏移量
    self.redView.layer.shadowOffset = CGSizeMake(30, 30);
    // 设置阴影模糊的半径
    self.redView.layer.shadowRadius = 5;
    
    // 添加边框
    // 边框宽度,往里走
    self.redView.layer.borderWidth = 5;
    // 边框颜色
    self.redView.layer.borderColor = [UIColor yellowColor].CGColor;
    
    // 设置圆角
    self.redView.layer.cornerRadius = 50;
}


@end
