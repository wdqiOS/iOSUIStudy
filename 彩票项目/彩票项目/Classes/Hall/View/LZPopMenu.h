//
//  LZPopMenu.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//
// MyBlock 类型 void(^)(void)
typedef void(^MyBlock)(void);

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZPopMenu;

@protocol LZPopMenuDelegate <NSObject>

-(void)popMenuDidCloseBtn:(LZPopMenu *)popMenu;
-(void)popMenuCloseAnimationDone:(LZPopMenu *)popMenu;

@end

@interface LZPopMenu : UIView

+(instancetype)showIncenter:(CGPoint)center;
//-(void)hideInCenter:(CGPoint)center;

// 没有参数没有返回值的block void(^)(void)

-(void)hideInCenter:(CGPoint)center completion:(MyBlock)completion;

/** 代理 */
@property(nonatomic, weak) id<LZPopMenuDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
