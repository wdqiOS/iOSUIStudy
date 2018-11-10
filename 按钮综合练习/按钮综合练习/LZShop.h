//
//  Shop.h
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/26.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZShop : NSObject


/** 图片名称 */
@property(nonatomic, copy) NSString *icon;
/** 商品名称 */
@property(nonatomic, copy) NSString *name;


///**  提供构造方法 */
//-(instancetype)initWithIcon:(NSString *)icon name:(NSString *)name;
//
///** 类构造方法 */
//+(instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name;

/** 字典转模型 */
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
