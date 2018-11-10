//
//  LZDog.h
//  KVC的使用
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDog : NSObject

/** 姓名 */
@property(nonatomic, copy) NSString *name;

/** 价格 */
@property(nonatomic, assign) float price;

@end

NS_ASSUME_NONNULL_END
