//
//  LZFlagView.h
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LZFlagItem;

@interface LZFlagView : UIView

/** flagitem对象 */
@property(nonatomic, strong) LZFlagItem *item;

+(instancetype)flagView;

@end

NS_ASSUME_NONNULL_END
