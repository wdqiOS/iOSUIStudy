//
//  LZCarGroup.h
//  展示汽车数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZCar;
NS_ASSUME_NONNULL_BEGIN

@interface LZCarGroup : NSObject

/** 头部标题 */
@property(nonatomic, copy) NSString *title;

/** 头部 */
@property(nonatomic, copy) NSString *header;

/** 尾部 */
@property(nonatomic, copy) NSString *footer;

/** 车(模型) */
@property(nonatomic, strong) NSArray<LZCar *> *cars;

/** 类方法实例对象 */
+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
