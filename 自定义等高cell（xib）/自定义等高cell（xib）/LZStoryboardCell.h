//
//  LZStoryboardCell.h
//  自定义等高cell（xib）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZTg;

NS_ASSUME_NONNULL_BEGIN

@interface LZStoryboardCell : UITableViewCell

/** 团购模型 */
@property(nonatomic, strong) LZTg *tg;

@end

NS_ASSUME_NONNULL_END
