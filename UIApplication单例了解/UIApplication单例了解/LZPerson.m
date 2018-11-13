//
//  LZPerson.m
//  UIApplication单例了解
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPerson.h"

@implementation LZPerson

// 1. 程序一运行，就创建对象
static LZPerson *_instance;
// 什么时候调用：当类被加载到内存当中就会被调用。
+(void)load{
    NSLog(@"%s", __func__);
   _instance = [[self alloc] init];
}
// 2. 创建的对象，只有一个
+(instancetype)sharedPerson{
    return _instance;
}
// 3. 调用alloc init崩溃
// Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'There can only be one UIApplication instance.'
+(instancetype)alloc{
    if (_instance) {
        // 程序崩溃
        NSException *exc = [NSException exceptionWithName:@"NSInternalInconsistencyException"
                                                   reason:@"There can only be one LZPerson instance."
                                                 userInfo:nil];
        // 抛出异常
        [exc raise];
    }
    
    return [super alloc];
}



@end
