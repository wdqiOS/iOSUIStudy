//
//  LZSettingGroup.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//  组模型描述每一组

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZSettingGroup : NSObject

/** 头部标题 */
@property(nonatomic, copy) NSString *headerTitle;
/** 尾部标题 */
@property(nonatomic, copy) NSString *footerTitle;

/** 行模型数组 */
@property(nonatomic, strong) NSArray *items;

+(instancetype)grougWithItems:(NSArray *)items;

@end

NS_ASSUME_NONNULL_END
