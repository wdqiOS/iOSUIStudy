//
//  LZPerson.h
//  归档
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LZDog;

// 归档时需要遵守NSCoding协议
@interface LZPerson : NSObject <NSCoding, NSSecureCoding>

/** 名字 */
@property(nonatomic, strong) NSString *name;
/** 年龄 */
@property(nonatomic, assign) NSInteger age;

/** 狗 */
@property(nonatomic, strong) LZDog *dog;

@end

NS_ASSUME_NONNULL_END
