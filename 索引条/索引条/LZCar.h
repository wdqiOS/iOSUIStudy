//
//  LZCar.h
//  索引条
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZCar : NSObject

/** 名称 */
@property(nonatomic, copy) NSString *name;

/** 图标 */
@property(nonatomic, copy) NSString *icon;

+(instancetype)carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
