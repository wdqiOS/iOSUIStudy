//
//  ViewController.m
//  按钮图片拉伸
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LZExtension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 方法一：
//    [self test1];
    
    // 方式二：
//    [self test2];
    
    // 方式三：
//    [self test3];
    
    [self.button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    
}

#pragma mark --------------------
#pragma mark - 方法一
-(void)test1{
    // 1.1 创建UIImage对象
    UIImage *image = [UIImage imageNamed:@"news"];
    
    // 1.2 拿到image的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    // 1.3 返回一张受保护而且拉伸的图片 ----> CapInsets哪些地方受保护的区域
    // 方式一：
     //    UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 - 1, imageWidth * 0.5 - 1)];
     
     
//     UIImageResizingModeTile,     平铺
//     UIImageResizingModeStretch,  拉伸
    
     UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 - 0.5, imageWidth * 0.5 - 0.5) resizingMode:UIImageResizingModeTile];
    // 2、图片设置到按钮上
    [self.button setBackgroundImage:resizeImage forState:UIControlStateNormal];
}

#pragma mark --------------------
#pragma mark - 方法二
-(void)test2{
    // 1.1 创建图片对象
    UIImage *image = [UIImage imageNamed:@"buttongreen"];
    // 1.2 获取图片尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    // 1.3 图片拉伸
    // 右边需要保护的区域 = 图片的width - leftCapWidth - 1
    // default is 0. if non-zero, horiz. stretchable. right cap is calculated as width - leftCapWidth - 1
    UIImage *resizeImage = [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5 - 1];
    
    [self.button setBackgroundImage:resizeImage forState:UIControlStateNormal];
    
    
}

#pragma mark --------------------
#pragma mark - 方式三
-(void)test3 {
    [self.button setBackgroundImage:[UIImage resizeableImageWithLocalImageName:@"news"] forState:UIControlStateNormal];
}
@end
