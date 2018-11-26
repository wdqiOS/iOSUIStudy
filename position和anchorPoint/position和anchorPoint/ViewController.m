//
//  ViewController.m
//  position和anchorPoint
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** layer对象 */
@property(nonatomic, weak) CALayer *layer;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CALayer *layer = [CALayer layer];
//    layer.backgroundColor = UIColor.redColor.CGColor;
//    layer.frame = CGRectMake(200, 200, 100, 100);
//
//    self.layer = layer;
//    [self.view.layer addSublayer:layer];
    // UIView的center,就是它内部layer的position
    NSLog(@"cennter ------ %@", NSStringFromCGPoint(self.yellowView.center));
    NSLog(@"position ==== %@", NSStringFromCGPoint(self.yellowView.layer.position));
    NSLog(@"anchorpoint ===== %@", NSStringFromCGPoint(self.yellowView.layer.anchorPoint));
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.layer.position = self.view.center;
//    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
//    self.layer.position = CGPointMake(200, 200);
//    self.layer.anchorPoint = CGPointMake(0.5, 0);
    
//    self.yellowView.layer.position = CGPointMake(100, 100);
    NSLog(@"cennter ------ %@", NSStringFromCGPoint(self.yellowView.center));
    NSLog(@"position ==== %@", NSStringFromCGPoint(self.yellowView.layer.position));
    
    self.yellowView.layer.anchorPoint = CGPointMake(0.5, 0);
}


@end
