//
//  LZTgCell.h
//  购物车
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZTg;
@class LZTgCell;
@protocol LZTgCellDelegate <NSObject>

// @optional 可实现也可不实现 @required 表示必须实现，遵守协议的代理不实现方法会报警告
@optional
-(void)tgCellDidClickAddButton:(LZTgCell *)cell;
-(void)tgCellDidClickMinusButton:(LZTgCell *)cell;

@end


@interface LZTgCell : UITableViewCell

/** tg模型 */
@property(nonatomic, strong) LZTg *tg;

/** 代理 */
@property(nonatomic, weak) id<LZTgCellDelegate> delegate;

/**
 代理作用：
 1、传递事件；
 2、传递数据；
 3、解耦；
 */

@end

NS_ASSUME_NONNULL_END
