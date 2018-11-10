//
//  ViewController.m
//  播放音效
//
//  Created by 汪大强 on 2018/9/25.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
// 背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bgImgeView;

@property(nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1、加毛玻璃效果
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    // 2. 设置frame
    toolBar.frame = self.view.bounds;
    
    // 3、设置样式和透明度
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.98;
    // 4、加到背景图片上
    [self.bgImgeView addSubview:toolBar];
    
    // 5、创建播放器
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"mySong1.mp3" ofType:nil];
//    NSURL *url = [NSURL fileURLWithPath:path];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mySong1.mp3" withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    self.player = player;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@", self.bgImgeView);
}

/**
 播放/暂停
 
 @param button 按钮
 */
- (IBAction)playOrPause:(UIButton *)button {
    switch (button.tag) {
        case 2:
            [self.player play];
            break;
        case 3:
            [self.player pause];
            break;
        default:
            break;
    }
}

/**
 切换歌曲

 @param button 按钮
 */
- (IBAction)changeMusic:(UIButton *)button {
    // 歌曲名称
    NSString *musicName = nil;
    switch (button.tag) {
        case 1:
            musicName = @"mySong2.mp3";
            break;
        case 4:
            musicName = @"mySong3.mp3";
            break;
        default:
            break;
    }
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    
    [self.player play];
}





@end
