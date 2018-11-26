//
//  LZContactVC.h
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZContactItem;
@interface LZContactVC : UITableViewController

// 当前用户名
/** 用户名 */
@property(nonatomic, strong) NSString *accountName;

/** 联系人模型 */
@property(nonatomic, strong) LZContactItem *item;

@end

NS_ASSUME_NONNULL_END
