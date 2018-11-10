//
//  LZTg.h
//  购物车
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZTg : NSObject

/** icon */
@property(nonatomic, copy) NSString *icon;

/** buyCount */
@property(nonatomic, copy) NSString *buyCount;
/** price */
@property(nonatomic, copy) NSString *price;
/** title */
@property(nonatomic, copy) NSString *title;

/** 购买数量 */
@property(nonatomic, assign) int count;


@end

NS_ASSUME_NONNULL_END
