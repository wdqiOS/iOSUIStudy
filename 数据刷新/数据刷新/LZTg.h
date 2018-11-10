//
//  LZTg.h
//  数据刷新
//
//  Created by 汪大强 on 2018/11/9.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZTg : NSObject

/** icon */
@property(nonatomic, copy) NSString *icon;
/** buycount */
@property(nonatomic, copy) NSString *buyCount;
/** price */
@property(nonatomic, copy) NSString *price;
/** title */
@property(nonatomic, copy) NSString *title;

/** 记录打钩控件是否选中 */
@property(nonatomic, assign, getter=isChecked) BOOL checked;


@end

NS_ASSUME_NONNULL_END
