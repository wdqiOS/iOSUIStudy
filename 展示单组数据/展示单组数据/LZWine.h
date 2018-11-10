//
//  LZWine.h
//  展示单组数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZWine : NSObject

/** 名称 */
@property(nonatomic, copy) NSString *name;

/** 图标 */
@property(nonatomic, copy) NSString *image;

/** 价格 */
@property(nonatomic, copy) NSString *money;

/** 根据字典快速实例化酒对象 */
+(instancetype)wineWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
