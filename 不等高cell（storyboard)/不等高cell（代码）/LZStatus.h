//
//  LZStatus.h
//  不等高cell（代码）
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZStatus : NSObject

/** 文字/图片 */
/** text */
@property(nonatomic, copy) NSString *text;

/** icon */
@property(nonatomic, copy) NSString *icon;

/** name */
@property(nonatomic, copy) NSString *name;

/** vip */
@property(nonatomic, assign, getter=isVip) BOOL vip;

/** picture */
@property(nonatomic, copy) NSString *picture;

@end

NS_ASSUME_NONNULL_END
