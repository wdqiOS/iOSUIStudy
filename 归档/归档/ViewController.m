//
//  ViewController.m
//  归档
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZPerson.h"
#import "LZDog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark --------------------
#pragma mark - 存读按钮的点击事件
- (IBAction)saveButtonClick:(id)sender {
    
    LZPerson *person = [[LZPerson alloc] init];
    person.name = @"lz";
    person.age = 10;
    
    
    LZDog *dog = [[LZDog alloc] init];
    dog.name = @"糖宝";
    
    person.dog = dog;
    
    // 路径
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *pathString = [tmpPath stringByAppendingPathComponent:@"person.data"];
    NSLog(@"tmpPath === %@", pathString);
    // 归档
//    [NSKeyedArchiver archiveRootObject:person toFile:pathString];
    NSError *error = nil;
    [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:false error:&error];
    NSLog(@"error === %@", error);
    
}
- (IBAction)readButtonClick:(id)sender {
    // 路径
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *pathString = [tmpPath stringByAppendingPathComponent:@"person.data"];
    NSError *error = nil;
    LZPerson *person = [NSKeyedUnarchiver unarchivedObjectOfClass:[LZPerson class] fromData:[NSData dataWithContentsOfFile:pathString] error:&error];
 
//    LZPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:pathString];
 
    NSLog(@"person === %@ dog ==== %@ ", person.name, person.dog);
}

@end
