//
//  LZAddContactVC.h
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@class LZContactVC;
@class LZAddContactVC, LZContactItem;

// 1. 定义协议
@protocol LZAddContactVCDelegate <NSObject>

// 2. 定义协议方法
@optional
-(void)addContactVC:(LZAddContactVC *)addContactVC contactItem:(LZContactItem *)contactItem;


@end

@interface LZAddContactVC : UIViewController

/** 联系人控制器此方法耦合度态度，不适用 */
//@property(nonatomic, strong) LZContactVC *contactVC;

// 3. 代理属性
/** 代理 */
@property(nonatomic, weak) id<LZAddContactVCDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
