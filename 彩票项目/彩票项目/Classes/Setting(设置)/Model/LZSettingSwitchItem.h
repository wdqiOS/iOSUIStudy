//
//  LZSettingSwitchItem.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZSettingItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZSettingSwitchItem : LZSettingItem

/** 开关状态 */
@property(nonatomic, assign, getter=isOn) BOOL on;

@end

NS_ASSUME_NONNULL_END
