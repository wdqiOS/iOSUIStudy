//
//  LZSaveTool.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
// 存储工具类

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZSaveTool : NSObject

+ (nullable id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

@end

NS_ASSUME_NONNULL_END
