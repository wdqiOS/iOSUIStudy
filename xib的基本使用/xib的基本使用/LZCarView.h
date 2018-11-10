//
//  LZCarView.h
//  xib的基本使用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LZCar;

@interface LZCarView : UIView

/** LZCar模型 */
@property(nonatomic, strong) LZCar *car;

// 提供构造方法创建LZCarView

@end

NS_ASSUME_NONNULL_END
