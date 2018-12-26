//
//  LZSettingItem.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//  设置行模型

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    LZSettingItemRightViewStateNone,
    LZSettingItemRightViewStateArrow,
    LZSettingItemRightViewStateSwitch,
} LZSettingItemRightViewState;

@interface LZSettingItem : NSObject

/** 图片 */
@property(nonatomic, strong) UIImage *icon;

/** 标题 */
@property(nonatomic, copy) NSString *title;
/** 子标题 */
@property(nonatomic, copy) NSString *subTitle;

///** 右侧视图 */
//@property(nonatomic, assign) LZSettingItemRightViewState type;
/** 点击这一行要做的事情 */
@property(nonatomic, copy) void(^operationBlock)(NSIndexPath *indexPath);

/** 快速实例化对象 */
+(instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
+(instancetype)itemWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
