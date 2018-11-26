//
//  LZImageView.h
//  模仿系统的UIImageView
//
//  Created by 汪大强 on 2018/11/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZImageView;

@protocol LZImageViewDelegate <NSObject>

@optional
-(void)clickPic:(LZImageView *)imageView;

@end

@interface LZImageView : UIView

/** 图片名称 */
@property(nonatomic, strong) UIImage *image;
/** 重构方法 */
-(instancetype)initWithImage:(UIImage *)image;

/** 代理 */
@property(nonatomic, weak) id<LZImageViewDelegate> delegate;



@end

NS_ASSUME_NONNULL_END
