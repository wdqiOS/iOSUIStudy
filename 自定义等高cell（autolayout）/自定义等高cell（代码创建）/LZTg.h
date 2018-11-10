//
//  LZTg.h
//  自定义等高cell（代码创建）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZTg : NSObject

/** 图标 */
@property(nonatomic, copy) NSString *icon;

/** 标题 */
@property(nonatomic, copy) NSString *title;

/** 价格 */
@property(nonatomic, copy) NSString *price;

/** 购买数 */
@property(nonatomic, copy) NSString *buyCount;

+(instancetype)tgWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
