//
//  LZShopView.h
//  xib自定义View
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 xib的使用注意：
 1> 如果一个view从xib中创建，就不能用[[xxxx alloc] init] 和 [[xxx alloc] initWithFrame:]创建
 2> 如果一个xib经常使用，应该提供快速构造方法
 3> 如果view从xib中加载：
    用代码创建子控件，得在 initWithCoder: 和 awakeFromNib:
 4> 如果一个view从xib中加载，会调用initWithCoder: 和 awakeFromNib，不会调用init 和 initWithFrame:
 */

@interface LZShopView : UIView

// 提供set方法
-(void)setIcon:(NSString *)icon;
-(void)setName:(NSString *)name;

// 提供快速创建方法
+(instancetype)shopView;

@end

NS_ASSUME_NONNULL_END
