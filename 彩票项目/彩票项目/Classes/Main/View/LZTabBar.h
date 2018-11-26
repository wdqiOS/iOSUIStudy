//
//  LZTabBar.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZTabBar;

@protocol LZTabBarDelegate <NSObject>

@required
-(void)tabBar:(LZTabBar *)tabBar index:(NSInteger)index;

@end

@interface LZTabBar : UIView

/** 子控制器个数 */
//@property(nonatomic, assign) NSInteger count;
/** 模型数组 */
@property(nonatomic, strong) NSArray *items;

/** 代理 */
@property(nonatomic, weak) id<LZTabBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
