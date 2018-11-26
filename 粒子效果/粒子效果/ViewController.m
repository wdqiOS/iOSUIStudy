//
//  ViewController.m
//  粒子效果
//
//  Created by 汪大强 on 2018/11/22.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZVCView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet LZVCView *vcView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(id)sender {
    [self.vcView start];
}

- (IBAction)redraw:(id)sender {
    [self.vcView redraw];
}


@end
