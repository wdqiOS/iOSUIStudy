//
//  LZDog.h
//  归档
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDog : NSObject<NSSecureCoding>

/** 名字 */
@property(nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
