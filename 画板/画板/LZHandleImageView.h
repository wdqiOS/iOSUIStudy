//
//  LZHandleImageView.h
//  画板
//
//  Created by 汪大强 on 2018/11/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LZHandleImageView;
@protocol LZHandleImageViewDelegate <NSObject>

@optional
-(void)handleImageView:(LZHandleImageView *)handleImageView newImage:(UIImage *)newImage;

@end

@interface LZHandleImageView : UIView

/** 图片 */
@property(nonatomic, strong) UIImage *image;

/** 代理 */
@property(nonatomic, weak) id<LZHandleImageViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
