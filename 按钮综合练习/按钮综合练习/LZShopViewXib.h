//
//  LZShopViewXib.h
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LZShop;

@interface LZShopViewXib : UIView

/** 数据模型 */
@property(nonatomic, strong) LZShop *shop;

/** 快速构造方法 */
+(instancetype)shopView;

@end

NS_ASSUME_NONNULL_END
