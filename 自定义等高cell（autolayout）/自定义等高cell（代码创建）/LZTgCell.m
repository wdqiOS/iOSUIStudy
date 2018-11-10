//
//  LZTgCell.m
//  自定义等高cell（代码创建）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTgCell.h"
#import "LZTg.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

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
        CGFloat space = 10;
        /** 图标 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        // 添加约束
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView.bottom).offset(-space);
            make.width.equalTo(80);
        }];
        
        /** 标题 */
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.top);
            make.left.equalTo(iconImageView.right).offset(space);
            make.right.equalTo(self.contentView.right).offset(-space);
            make.height.equalTo(20);
        }];
        
        /** 价格 */
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = UIColor.orangeColor;
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.left);
            make.bottom.equalTo(iconImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        /** 购买数 */
        UILabel *buyCountLabel = [[UILabel alloc] init];
        buyCountLabel.textColor = UIColor.lightGrayColor;
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        [buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(priceLabel.bottom);
            make.right.equalTo(titleLabel.right);
            make.left.equalTo(priceLabel.right).offset(10);
            make.height.equalTo(15);
        }];
    }
    return self;
}

// 设置所有子控件的frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    CGFloat space = 10;
//    CGFloat contentViewW = self.contentView.frame.size.width;
//    CGFloat contentViewH = self.contentView.frame.size.height;
//    /** 图标 */
//    CGFloat iconX = space;
//    CGFloat iconY = space;
//    CGFloat iconW = 80;
//    CGFloat iconH = contentViewH - 2*space;
//    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
//
//    /** 标题 */
//    CGFloat titleX = iconX + iconW + space;
//    CGFloat titleY = iconY;
//    CGFloat titleW = contentViewW - titleX - space;
//    CGFloat titleH = 20;
//    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
//
//    /** 价格 */
//    CGFloat priceX = titleX;
//    CGFloat priceH = 20;
//    CGFloat priceY = iconY + iconH - priceH;
//    CGFloat priceW = 100;
//    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
//
//    /** 购买数 */
//    CGFloat buyCountW = contentViewW - (priceX + priceW + space + space);
//    CGFloat buyCountH = 14;
//    CGFloat buyCountX = contentViewW - buyCountW - space;
//    CGFloat buyCountY = contentViewH - space - buyCountH;
//    self.buyCountLabel.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
    
    // 使用约束
    
    
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
