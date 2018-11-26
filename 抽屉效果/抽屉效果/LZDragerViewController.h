//
//  LZDragerViewController.h
//  抽屉效果
//
//  Created by 汪大强 on 2018/11/18.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZDragerViewController : UIViewController


/** 左view */
// readonly的本质是不允许重写sett方法
@property(nonatomic, weak, readonly) UIView *leftV;
/** 右view */
@property(nonatomic, weak, readonly) UIView *rightV;

/** 主view */
@property(nonatomic, weak, readonly) UIView *mainV;

@end

NS_ASSUME_NONNULL_END
