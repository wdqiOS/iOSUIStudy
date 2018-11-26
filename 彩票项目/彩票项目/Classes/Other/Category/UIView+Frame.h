//
//  UIView+Frame.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

/** 在分类中 @property 只会生成get，set方法，并不会生成下划线成员属性 */
@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) CGFloat x;

@property(nonatomic, assign) CGFloat y;

//-(CGFloat)width;
//-(void)setWidth:(CGFloat)width;
//
//-(CGFloat)height;
//-(void)setHeight:(CGFloat)height;
//
//-(CGFloat)x;
//-(void)setx

@end

NS_ASSUME_NONNULL_END
