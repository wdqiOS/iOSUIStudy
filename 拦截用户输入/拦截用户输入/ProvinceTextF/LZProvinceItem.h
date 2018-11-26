//
//  LZProvinceItem.h
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZProvinceItem : NSObject

/** 当前省份下的城市 */
@property(nonatomic, strong) NSArray *Cities;

/** 省份的名称 */
@property(nonatomic, strong) NSString *State;

/** 快速把字典转成模型 */
+(instancetype)itemWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
