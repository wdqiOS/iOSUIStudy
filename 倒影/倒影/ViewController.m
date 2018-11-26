//
//  ViewController.m
//  倒影
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 图片对象 */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 方法一：在storyboard中将图片的中心点设置为当前中心点的-(一半)
    // 方法二：
    // 1. 移动图片的锚点和position
    self.imageV.layer.anchorPoint = CGPointMake(0.5, 1);
    self.imageV.layer.position = CGPointMake(self.imageV.center.x, self.imageV.center.y - self.imageV.bounds.size.height * 0.5);
    
    // 2. 再进行复制旋转
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    // 绕着复制层的锚点进行旋转
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    // 阴影
    repL.instanceRedOffset -= 0.5;
    repL.instanceGreenOffset -= 0.5;
    repL.instanceBlueOffset -= 0.5;
    repL.instanceAlphaOffset -= 0.5;

}


@end
