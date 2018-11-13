//
//  LZFlagItem.h
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZFlagItem : NSObject

/** 名称 */
@property(nonatomic, copy) NSString *name;
/** 图片名称 */
@property(nonatomic, copy) NSString *icon;

+(instancetype)itemWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
