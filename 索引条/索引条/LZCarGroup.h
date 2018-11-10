//
//  LZCarGroup.h
//  索引条
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZCar;

NS_ASSUME_NONNULL_BEGIN

@interface LZCarGroup : NSObject

/** 一组所有的车型LZCar */
@property(nonatomic, copy) NSArray<LZCar *> *cars;

/** 头部标题 */
@property(nonatomic, copy) NSString *title;

+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
