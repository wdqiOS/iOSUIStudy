//
//  ViewController.m
//  图片加载方式
//
//  Created by 汪大强 on 2018/9/23.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "ViewController.h"

/*
    加载图片的方式：
    1、imageNamed:
    2、imageWithContentOfFile:
 
    1、加载Assets.xcassets这里面的图片；
        1> 打包后变成Assets.car
        2> 拿不到路径
        3> 只能通过imageNamed:来加载图片
        4> 不能通过imageWithContentsOfFile:来加载图片
 
    2、放到项目中的图片
        1> 可以拿到图片路径
        2> 能通过imageNamed:来加载图片
        3> 也能通过imageWithContentOfFile:来加载图片
 */

@interface ViewController ()
{
    int cout;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSPort *port;
@end

@implementation ViewController


/*
 图片加载方式：
 1> imageNamed:
    a. 就算指向它的指针被销毁，该资源也不会被从内存中干掉
    b. 放到Assets.xcassets的图片，默认就有缓存
    c. 图片经常被使用
 
 2> imageWithContentOfFile:
    a. 指向它的指针被销毁，该资源也会从内存中干掉
    b. 放到项目中的图片，不带有缓存
    c. 不经常用的，大批量的图片
 */

- (void)viewDidLoad {
    [super viewDidLoad];
   
    LZLog(@"%@", @"111");
    
//    [self performSelectorInBackground:@selector(test) withObject:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
    // 图片的设置方式
    // 方式一
    self.imageView.image = [UIImage imageNamed:@"1"];
    // 方式二
    // 图片路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestImage" ofType:@"jpg"];
//    self.imageView.image = [UIImage imageWithContentsOfFile:path];
//    [ViewController nestTest];
    
    
    //
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3",@"4",@"5",@"6", nil];
    
//    for (int i = 0; i < mutableArray.count; i++) {
//        if (i == 3) {
//            [mutableArray removeObject:mutableArray[i]];
//        }
//        NSLog(@"mutableArray === %@", mutableArray);
//    }
    
    int i = 0;
    for (NSString *obj in mutableArray) {
        if (i == mutableArray.count - 1) {
            [mutableArray removeObject:obj];
        }
        i++;
        NSLog(@"mutableArray === %@", mutableArray);
    }
    
    [mutableArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 3) {
            [mutableArray removeObject:obj];
        }
        NSLog(@"muarr == %@", obj);
    }];
    
    
    
    
    
}

+ (void)nestTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSTimer *tickTimer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timerHandle1) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:tickTimer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"-end-");
    });
}

/**
 不停的运行与退出最内层runloop
 */
+ (void)timerHandle1 {
    NSLog(@"timer111-%@",[[NSRunLoop currentRunLoop] currentMode]);
    // 防止多次添加timer，开发中应特别注意
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSTimer *tickTimer2 = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timerHandle2) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:tickTimer2 forMode:UITrackingRunLoopMode];
    });
    [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode  beforeDate:[NSDate distantFuture]];
    
}

+ (void)timerHandle2 {
    NSLog(@"timer222-%@",[[NSRunLoop currentRunLoop] currentMode]);
    CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
}



//- (void)nestTest {
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timerHandle1) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode  beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]];
//
//        NSTimer *t = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"11111111");
//        }];
//        [[NSRunLoop currentRunLoop] addTimer:t forMode:UITrackingRunLoopMode];
//        [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode  beforeDate:[NSDate distantFuture]];
//
//        NSLog(@"-end-");
//    });
//}
//
//
///**
// 不停的运行与退出最内层runloop
// */
//- (void)timerHandle1 {
//    NSLog(@"timer111-%@",[[NSRunLoop currentRunLoop] currentMode]);
//    // 防止多次添加timer，开发中应特别注意
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSTimer *tickTimer2 = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timerHandle2) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:tickTimer2 forMode:UITrackingRunLoopMode];
//    });
//    [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode  beforeDate:[NSDate distantFuture]];
//}
//
//- (void)timerHandle2 {
//    NSLog(@"timer222-%@",[[NSRunLoop currentRunLoop] currentMode]);
//    CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
//}
//
//-(void)test{
//
//
//
//
//
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"++++");
//        cout++;
//        if (cout > 10) {
//            [self.timer invalidate];
//            self.timer = nil;
//
//        }
//
//    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.port sendBeforeDate:[NSDate date] msgid:100 components:@[@"1"] from:self.port reserved:0];
//    });
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//    self.port = [NSPort port];
//    self.port.delegate = self;
//    [[NSRunLoop currentRunLoop] addPort:self.port forMode:NSDefaultRunLoopMode];
//     [[NSRunLoop currentRunLoop] run];
//
//    NSLog(@"======");
//}
//- (void)handlePortMessage:(NSPortMessage *)message{
//    [[NSRunLoop currentRunLoop] performInModes:@[UITrackingRunLoopMode] block:^{
//
//    }];
//
//    NSLog(@"当前1=====%@",[NSRunLoop currentRunLoop].currentMode);
////    [self.timer invalidate];
////    self.timer = nil;
////    [self.port invalidate];
////    self.port = nil;
////    CFRunLoopStop([NSRunLoop currentRunLoop].getCFRunLoop);
////    [[NSRunLoop currentRunLoop] runMode:UITrackingRunLoopMode beforeDate:[NSDate distantFuture]];
////    NSLog(@"当前=====%@",[NSRunLoop currentRunLoop].currentMode);
//}
//
//
//



@end
