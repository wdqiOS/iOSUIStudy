//
//  LZSettingArrowItem.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//  绑定类名，1、绑定类名字符串，2、绑定类名

#import "LZSettingItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZSettingArrowItem : LZSettingItem

/** 类名字符串 */
//@property(nonatomic, copy) NSString *<#name#>;

/** 目标控制器 */
@property(nonatomic, assign) Class desVC;

@end

NS_ASSUME_NONNULL_END
