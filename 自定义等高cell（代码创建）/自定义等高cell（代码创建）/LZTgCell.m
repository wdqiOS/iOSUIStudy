//
//  LZTgCell.m
//  自定义等高cell（代码创建）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTgCell.h"
#import "LZTg.h"


@interface LZTgCell ()

/** 图标 */
@property(nonatomic, weak) UIImageView *iconImageView;

/** 标题 */
@property(nonatomic, weak) UILabel *titleLabel;

/** 价格 */
@property(nonatomic, weak) UILabel *priceLabel;

/** 购买数 */
@property(nonatomic, weak) UILabel *buyCountLabel;

@end

@implementation LZTgCell

// 在这个方法中添加所有的子控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 图标 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.backgroundColor = UIColor.redColor;
        
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 标题 */
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        /** 价格 */
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = UIColor.orangeColor;
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        /** 购买数 */
        UILabel *buyCountLabel = [[UILabel alloc] init];
        buyCountLabel.textColor = UIColor.lightGrayColor;
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
    }
    return self;
}

// 设置所有子控件的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat space = 10;
//    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewW = CGRectGetWidth(self.contentView.frame);
//    CGFloat contentViewH = self.contentView.frame.size.height;
    CGFloat contentViewH = CGRectGetHeight(self.contentView.frame);
    /** 图标 */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 80;
    CGFloat iconH = contentViewH - 2*space;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 标题 */
//    CGFloat titleX = iconX + iconW + space;
    // 苹果提供的获取最大的x值
    CGFloat titleX = CGRectGetMaxX(self.iconImageView.frame) + space;
    CGFloat titleY = iconY;
    CGFloat titleW = contentViewW - titleX - space;
    CGFloat titleH = 20;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    /** 价格 */
    CGFloat priceX = titleX;
    CGFloat priceH = 20;
//    CGFloat priceY = iconY + iconH - priceH;
    CGFloat priceY = CGRectGetMaxY(self.iconImageView.frame) - priceH;
    CGFloat priceW = 100;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    /** 购买数 */
    CGFloat buyCountW = contentViewW - (priceX + priceW + space + space);
    CGFloat buyCountH = 14;
    CGFloat buyCountX = contentViewW - buyCountW - space;
//    CGFloat buyCountY = contentViewH - space - buyCountH;
    CGFloat buyCountY = CGRectGetMaxY(self.iconImageView.frame) - buyCountH;
    self.buyCountLabel.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);;
}

// 设置子控件的数据
// 重写团购数据模型setter方法
-(void)setTg:(LZTg *)tg{
    _tg = tg;
    
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    
    self.titleLabel.text = tg.title;
    
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", tg.price];
    
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
