//
//  main.m
//  plist简介
//
//  Created by 汪大强 on 2018/9/26.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 数组
        NSArray *names = @[@"lz", @"wdq", @"lzw", @"lzd"];
        BOOL flag = [names writeToFile:@"/Users/wangdaqiang/Desktop/wdq.plist" atomically:YES];
        if (flag) {
            NSLog(@"写入成功");
        }else{
            NSLog(@"写入失败");
        }
    }
    return 0;
}
