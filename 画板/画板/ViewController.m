//
//  ViewController.m
//  画板
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZDrawView.h"
#import "LZHandleImageView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, LZHandleImageViewDelegate>
/** 画板view */
@property (weak, nonatomic) IBOutlet LZDrawView *drawView;



@end

@implementation ViewController

#pragma mark --------------------
#pragma mark - 是否隐藏状态栏
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}

#pragma mark --------------------
#pragma mark - 按钮点击事件 属于谁的东西，应该在谁里面去写
// 清除
- (IBAction)clear:(id)sender {
    [self.drawView clear];
}

// 撤销
- (IBAction)undo:(id)sender {
    [self.drawView undo];
}

// 橡皮擦
- (IBAction)earase:(id)sender {
    [self.drawView erase];
}

// 设置绘制线的宽度
- (IBAction)setLLineWidth:(UISlider *)sender {
    [self.drawView setLineWidth:sender.value];
}

// 设置绘制线颜色
- (IBAction)setLineColor:(UIButton *)sender {
    [self.drawView setLineColor:sender.backgroundColor];
}


// 照片
- (IBAction)photo:(id)sender {
    // 从系统相册当中选择一张图片
    // 1. 弹出系统相册
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    
    // 设置照片的来源
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePickerVC.delegate = self;
    // modal出系统相册
    [self presentViewController:imagePickerVC animated:true completion:nil];
}

#pragma mark --------------------
#pragma mark - UIImagePickerControllerDelegate协议方法
// 当选择某一个照片时，会调用这个方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    NSLog(@"info === %@", info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
//    NSData *data = UIImageJPEGRepresentation(image, 1);
//    [data writeToFile:@"/Users/wangdaqiang/Desktop/1.jpg" atomically:YES];
//    NSData *data = UIImagePNGRepresentation(image);
//    [data writeToFile:@"/Users/wangdaqiang/Desktop/1.png" atomically:YES];
    
    LZHandleImageView *handleView = [[LZHandleImageView alloc] init];
    
    handleView.frame = self.drawView.frame;
    handleView.backgroundColor = UIColor.clearColor;
    handleView.image = image;
    handleView.delegate = self;
    [self.view addSubview:handleView];
    
    
    
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.drawView.frame];
//    imageV.image = image;
//    imageV.userInteractionEnabled = YES;
//    // 添加手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//    [imageV addGestureRecognizer:pan];
//    UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pin:)];
//    [imageV addGestureRecognizer:pin];
//
//    UILongPressGestureRecognizer *longp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longp:)];
//    [imageV addGestureRecognizer:longp];
//
//
//    [self.view addSubview:imageV];
    
//    self.drawView.image = image;
    // 取消弹出的系统相册
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark --------------------
#pragma mark - LZHandleImageViewDelegate
-(void)handleImageView:(LZHandleImageView *)handleImageView newImage:(UIImage *)newImage{
    self.drawView.image = newImage;
}


#pragma mark --------------------
#pragma mark - 手势
-(void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint transP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    
    // 复位
    [pan setTranslation:CGPointZero inView:pan.view];
}

-(void)pin:(UIPinchGestureRecognizer *)pin{
    pin.view.transform = CGAffineTransformScale(pin.view.transform, pin.scale, pin.scale);
    // 复位
    [pin setScale:1];
}

-(void)longp:(UILongPressGestureRecognizer *)longp{
    if (longp.state == UIGestureRecognizerStateBegan) {
        // 先让图片闪一下，把图片绘制到画板当中
        //
        [UIView animateWithDuration:0.5 animations:^{
            longp.view.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                longp.view.alpha = 1;
                
            }completion:^(BOOL finished) {
                // 把图片绘制到画板中
                UIGraphicsBeginImageContextWithOptions(longp.view.bounds.size, NO, 0);
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [longp.view.layer renderInContext:ctx];
                
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                self.drawView.image = newImage;
                
                [longp.view removeFromSuperview];
                
            }];
        }];
       
        
    }
}

// 保存
- (IBAction)save:(id)sender {
    // 把绘制的东西保存到系统相册中
    // 1. 开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    // 2. 把画板上的内容渲染到上下文当中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.drawView.layer renderInContext:ctx];
    // 3. 从上下文中取出一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4. 关闭上下文
    UIGraphicsEndImageContext();
    
    // 5. 把图片保存到系统相册当中
    // 注意：@selector里面的方法不能够瞎写，必须得是image:didFinishSavingWithError:contextInfo:
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

// 保存完毕时调用
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"error === %@   contextInfo === %@", error, contextInfo);
    if (!error) { // 表示成功
        
    }else{ // 表示保存失败
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
