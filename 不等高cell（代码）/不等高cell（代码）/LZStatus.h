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


/** frame数据 */
/** 图像frame */
@property(nonatomic, assign) CGRect iconFrame;
/** 昵称frame */
@property(nonatomic, assign) CGRect nameFrame;
/** vipframe */
@property(nonatomic, assign) CGRect vipFrame;
/** 正文frame */
@property(nonatomic, assign) CGRect textFrame;
/** 配图frame */
@property(nonatomic, assign) CGRect pictureFrame;

/** cell的高度 */
@property(nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
