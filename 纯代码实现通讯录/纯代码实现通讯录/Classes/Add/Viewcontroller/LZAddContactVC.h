//
//  LZAddContactVC.h
//  纯代码实现通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZAddContactVC, LZContactItem;

// 1. 定义协议
@protocol LZAddContactVCDelegate <NSObject>

// 2. 定义协议方法
@optional
-(void)addContactVC:(LZAddContactVC *)addContactVC contactItem:(LZContactItem *)contactItem;


@end

@interface LZAddContactVC : UIViewController

// 3. 代理属性
/** 代理 */
@property(nonatomic, weak) id<LZAddContactVCDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
