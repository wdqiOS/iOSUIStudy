//
//  LZTgCell.m
//  购物车
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTgCell.h"
#import "LZTg.h"
#import "LZCircleButton.h"

@interface LZTgCell ()

/** icon */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

// 减号按钮
@property (weak, nonatomic) IBOutlet LZCircleButton *minusButton;


@end

@implementation LZTgCell

-(void)setUpCircleButton:(UIButton *)btn{
    // 设置边框宽度
    btn.layer.borderWidth = 1.0;
    // 设置边框颜色
    btn.layer.borderColor = [UIColor orangeColor].CGColor;
    // 设置圆角半径
   btn.layer.cornerRadius = btn.frame.size.width * 0.5;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    [self setUpCircleButton:self.minusButton];
//    [self setUpCircleButton:self.addButton];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark --------------------
#pragma mark - 加号点击
- (IBAction)addBtn {
    // 1. 修改模型
    self.tg.count++;
    // 2. 修改界面
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.tg.count];
    // 减号按钮可以点击了
    self.minusButton.enabled = true;
    
    // 4. 通知代理（代用代理的方法）
    // 判断代理是否实现了协议方法
    if([self.delegate respondsToSelector:@selector(tgCellDidClickAddButton:)]){
        [self.delegate tgCellDidClickAddButton:self];
    }
    
}

// KVO

#pragma mark --------------------
#pragma mark - 减号点击
- (IBAction)minusBtn {
    // 1. 修改模型
    self.tg.count--;
    // 2. 修改界面
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.tg.count];
    if (self.tg.count == 0) {
        self.minusButton.enabled = false;
    }
    
    // 4. 通知代理（代用代理的方法）
    if ([self.delegate respondsToSelector:@selector(tgCellDidClickMinusButton:)]) {
        [self.delegate tgCellDidClickMinusButton:self];
    }
}

-(void)setTg:(LZTg *)tg{
    _tg = tg;
    
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = tg.price;
    // 根据count决定countLabel显示的数据
    self.countLabel.text = [NSString stringWithFormat:@"%d", tg.count];
    
    // 根据count决定减号按钮是否能点击
    self.minusButton.enabled = (tg.count > 0);
    
}


@end
