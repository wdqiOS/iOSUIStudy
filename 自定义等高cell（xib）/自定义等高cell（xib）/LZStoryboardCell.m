//
//  LZStoryboardCell.m
//  自定义等高cell（xib）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZStoryboardCell.h"
#import "LZTg.h"

@interface LZStoryboardCell ()
/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** 价格 */
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
/** 购买数量 */
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;


@end

@implementation LZStoryboardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTg:(LZTg *)tg{
    _tg = tg;
    
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", tg.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人购买", tg.buyCount];
}

@end
