//
//  LZWheelView.h
//  转盘
//
//  Created by 汪大强 on 2018/11/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZWheelView : UIView

/** 快速实例化一个轮子 */
+(instancetype)wheelView;

/** 让转盘开始旋转 */
-(void)rotation;
/** 让转盘停止旋转 */
-(void)stop;

@end

NS_ASSUME_NONNULL_END
