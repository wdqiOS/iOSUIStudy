//
//  LZBaseTableViewController.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/28.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZSettingTableViewCell.h"
#import "MBProgressHUD+WJExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZBaseTableViewController : UITableViewController

/** 组模型 */
@property(nonatomic, strong) NSMutableArray *groups;

@end

NS_ASSUME_NONNULL_END
