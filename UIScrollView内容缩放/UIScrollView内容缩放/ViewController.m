//
//  ViewController.m
//  UIScrollView内容缩放
//
//  Created by 汪大强 on 2018/10/9.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/** imageView */
@property(nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 创建图片
    UIImage *image = [UIImage imageNamed:@"logo"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    self.scrollView.contentSize = image.size;
    
    // 设置缩放比例
    self.scrollView.maximumZoomScale = 2.0f;
    self.scrollView.minimumZoomScale = 0.5f;
}


#pragma mark --------------------
#pragma mark - scrollView协议方法

/**
 返回需要缩放的子控件

 @param scrollView scrollView对象
 @return 缩放的对象
 */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


/**
 正在缩放

 @param scrollView scrollview对象
 */
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"%f", scale);
}

@end
