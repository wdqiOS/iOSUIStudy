//
//  LZStatusCell.h
//  不等高cell（代码）
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZStatus;

NS_ASSUME_NONNULL_BEGIN

@interface LZStatusCell : UITableViewCell

/** 微博模型 */
@property(nonatomic, strong) LZStatus *statuses;

// 兼容iOS8.0以前的方法
-(CGFloat)cellHeight;

@end

NS_ASSUME_NONNULL_END
