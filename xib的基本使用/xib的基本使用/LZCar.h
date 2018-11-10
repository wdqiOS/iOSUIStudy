//
//  LZCar.h
//  xib的基本使用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZCar : NSObject

/** 图片 */
@property(nonatomic, copy) NSString *image;

/** 标题 */
@property(nonatomic, copy) NSString *title;

/** 子标题 */
@property(nonatomic, copy) NSString *subTitle;

/** 跟帖 */
@property(nonatomic, copy) NSString *follow;

// 提供快速构造方法
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
