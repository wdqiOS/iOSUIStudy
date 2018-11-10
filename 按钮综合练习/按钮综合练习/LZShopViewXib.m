//
//  LZShopViewXib.m
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZShopViewXib.h"
#import "LZShop.h"

@interface LZShopViewXib ()

/** 商品图片 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 商品名称 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation LZShopViewXib

+(instancetype)shopView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

#pragma mark --------------------
#pragma mark - 添加子控件
-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)setShop:(LZShop *)shop{
    _shop = shop;
    
    // 设置子控件的数据
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}

@end
