//
//  ViewController.m
//  模仿系统的UIImageView
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZImageView.h"

@interface ViewController ()<LZImageViewDelegate>

/** 系统imageview */
@property(nonatomic, weak)  UIImageView *imageV;

/** 自定义imageview */
@property(nonatomic, weak) LZImageView *lzimageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIImageView *imageV = [[UIImageView alloc] init];
//    imageV.frame = CGRectMake(0, 0, 200, 200);
//    imageV.image = [UIImage imageNamed:@"1"];
//    self.imageV = imageV;
//    [self.view addSubview:imageV];
    
    
//    LZImageView *lzimageV = [[LZImageView alloc] init];
//    lzimageV.frame = CGRectMake(0, 200, 200, 200);
//    lzimageV.image = [UIImage imageNamed:@"1"];
//    self.lzimageV = lzimageV;
//    [self.view addSubview:lzimageV];
    
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
//    self.imageV = imageV;
//    [self.view addSubview:imageV];
    
    LZImageView *lzimageV = [[LZImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.lzimageV = lzimageV;
    lzimageV.delegate = self;
    [self.view addSubview:lzimageV];
   
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    
}

#pragma mark --------------------
#pragma mark - 自定义图片协议方法
-(void)clickPic:(LZImageView *)imageView{
    NSLog(@"%s", __func__);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.imageV.image = [UIImage imageNamed:@"2"];
    self.lzimageV.image = [UIImage imageNamed:@"2"];
}

@end
