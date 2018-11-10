//
//  LZPageView.h
//  UIScrollView的分页
//
//  Created by 汪大强 on 2018/10/11.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZPageView : UIView

/** 图片名数据 */
@property(nonatomic, strong) NSArray<NSString *> *imageNames;

+(instancetype)pageView;



@end

NS_ASSUME_NONNULL_END
