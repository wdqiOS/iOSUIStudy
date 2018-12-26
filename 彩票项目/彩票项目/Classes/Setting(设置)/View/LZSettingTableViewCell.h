//
//  LZSettingTableViewCell.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZSettingItem.h"
#import "LZSettingGroup.h"
#import "LZSettingArrowItem.h"
#import "LZSettingSwitchItem.h"

NS_ASSUME_NONNULL_BEGIN
@class LZSettingItem;

@interface LZSettingTableViewCell : UITableViewCell

/** 行模型 */
@property(nonatomic, strong) LZSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;
+(instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style;


@end

NS_ASSUME_NONNULL_END
