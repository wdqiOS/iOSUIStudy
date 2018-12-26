//
//  LZNewFeatureCollectionViewCell.h
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZNewFeatureCollectionViewCell : UICollectionViewCell

/** 背景图片 */
@property(nonatomic, strong) UIImage *bgImage;

-(void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pageCount;

@end

NS_ASSUME_NONNULL_END
