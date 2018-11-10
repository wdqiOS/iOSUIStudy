//
//  LZStatusCell.m
//  不等高cell（代码）
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZStatusCell.h"
#import "LZStatus.h"
@interface LZStatusCell ()
/** 图像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** vip */
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
/** 正文 */
@property (weak, nonatomic) IBOutlet UILabel *text_label;
/** 配图 */
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
/** 配图高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeight;
/** 配图底部距离 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureBottom;

@end

@implementation LZStatusCell

/**
 设置子控件的数据

 @param statuses 数据模型
 */
-(void)setStatuses:(LZStatus *)statuses{
    _statuses = statuses;
    
    
    self.iconImageView.image = [UIImage imageNamed:statuses.icon];
    self.nameLabel.text = statuses.name;
    
    if (statuses.isVip) {
        self.vipImageView.hidden = false;
        self.nameLabel.textColor = [UIColor orangeColor];
    }else{
        self.vipImageView.hidden = true;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.text_label.text = statuses.text;

    if (statuses.picture) { // 有配图
        self.pictureImageView.hidden = false;
        self.pictureImageView.image = [UIImage imageNamed:statuses.picture];
        self.pictureHeight.constant = 100;
        self.pictureBottom.constant = 10;
    }else{ // 无配图
        self.pictureImageView.hidden = true;
        self.pictureHeight.constant = 0;
        self.pictureBottom.constant = 0;
    }
}

#pragma mark --------------------
#pragma mark - 兼容iOS8.0以前的方法

-(void)awakeFromNib{
    [super awakeFromNib];
    self.text_label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}
-(CGFloat)cellHeight{
    // 手动设置文字的最大宽度（让label能够计算自己最真实的尺寸）
//    self.text_label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    // 强制刷新（label根据约束自动计算它的宽度和高度）
    [self layoutIfNeeded];
    
    CGFloat cellHeight = 0;
    if (self.statuses.picture) { // 有配图
        cellHeight = CGRectGetMaxY(self.pictureImageView.frame) + 10;
    }else{ // 无配图
        cellHeight = CGRectGetMaxY(self.text_label.frame) + 10;
    }
    return cellHeight;
}

@end
