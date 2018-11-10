//
//  LZShopView.h
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LZShop;

@interface LZShopView : UIView


/** 商品模型 */
@property(nonatomic, strong) LZShop *shop;

// 构造方法
-(instancetype)initWithShop:(LZShop *)shop;
+(instancetype)shopViewWithShop:(LZShop *)shop;

/** 提供接口方法 */
//-(void)setIcon: (NSString *)icon;
//-(void)setName: (NSString *)name;


@end

NS_ASSUME_NONNULL_END
