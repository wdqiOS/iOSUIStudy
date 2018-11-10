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
@property(nonatomic, weak) UIImageView *iconImageView;

/** 昵称 */
@property(nonatomic, weak) UILabel *nameLabel;

/** vip */
@property(nonatomic, weak) UIImageView *vipImageView;

/** 正文 */
@property(nonatomic, weak) UILabel *text_Label;

/** 配图 */
@property(nonatomic, weak) UIImageView *pictureImageView;

@end

@implementation LZStatusCell


/**
 重写实例cell对象

 @param style cell样式
 @param reuseIdentifier 复用标识
 @return cell实例对象
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 图像 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        /** vip */
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.image = [UIImage imageNamed:@"LOGO_24x24"];
        vipImageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        /** 正文 */
        UILabel *text_Label = [[UILabel alloc] init];
        text_Label.font = [UIFont systemFontOfSize:14.f];
        text_Label.numberOfLines = 0;
        [self.contentView addSubview:text_Label];
        self.text_Label = text_Label;
        
        /** 配图 */
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
    }
    return self;
}


/**
 设置所有的子控件frame
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
//    CGFloat space = 10;
//    
//    // 图像
//    CGFloat iconX = space;
//    CGFloat iconY = space;
//    CGFloat iconWH = 30;
//    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
//    
//    // 昵称
//    CGFloat nameX = CGRectGetMaxX(self.iconImageView.frame) + space;
//    CGFloat nameY = iconY;
//    // 计算昵称文字的尺寸
//    NSDictionary *nameAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
//    CGSize nameSize = [self.statuses.name sizeWithAttributes:nameAtt];
//    CGFloat nameW = nameSize.width;
//    CGFloat nameH = nameSize.height;
//    self.nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
//    
//    // vip
//    if(self.statuses.isVip){
//        CGFloat vipX = CGRectGetMaxX(self.nameLabel.frame) + space;
//        CGFloat vipW = 14;
//        CGFloat vipH = nameH;
////        CGFloat vipY = nameY + (nameH - vipWH) * 0.5;
//        CGFloat vipY = nameY;
//        self.vipImageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
//    }
//    
//    // 正文
//    CGFloat textX = iconX;
//    CGFloat textY = CGRectGetMaxY(self.iconImageView.frame) + space;
//    CGFloat textW = CGRectGetWidth(self.contentView.frame) - 2*space;
////    CGFloat textH = [self.statuses.text sizeWithAttributes:@{NSFontAttributeName : self.text_Label.font}].height;
////    CGFloat textH = [self.statuses.text sizeWithFont:self.text_Label.font constrainedToSize:CGSizeMake(textW, MAXFLOAT)].height;
//    CGFloat textH = [self.statuses.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.text_Label.font} context:nil].size.height;
//    self.text_Label.frame = CGRectMake(textX, textY, textW, textH);
//    
//    CGFloat cellH = 0;
//    // 配图
//    if (self.statuses.picture) {
//        CGFloat pictureWH = 100;
//        CGFloat pictureX = iconX;
//        CGFloat pictureY = CGRectGetMaxY(self.text_Label.frame) + space;
//        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
//        cellH = CGRectGetMaxY(self.pictureImageView.frame) + space;
//    }else{
//        cellH = CGRectGetMaxY(self.text_Label.frame) + space;
//    }
    
    // 设置控件frame
    self.iconImageView.frame = self.statuses.iconFrame;
    self.nameLabel.frame = self.statuses.nameFrame;
    self.vipImageView.frame = self.statuses.vipFrame;
    self.text_Label.frame = self.statuses.textFrame;
    self.pictureImageView.frame = self.statuses.pictureFrame;
}


/**
 设置子控件的数据

 @param statuses 数据模型
 */
-(void)setStatuses:(LZStatus *)statuses{
    _statuses = statuses;
    
    //
    self.iconImageView.image = [UIImage imageNamed:statuses.icon];
    self.nameLabel.text = statuses.name;
    
    if (statuses.isVip) {
        self.vipImageView.hidden = false;
        self.nameLabel.textColor = [UIColor orangeColor];
    }else{
        self.vipImageView.hidden = true;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.text_Label.text = statuses.text;
    
    if (statuses.picture) { // 有配图
        self.pictureImageView.hidden = false;
        self.pictureImageView.image = [UIImage imageNamed:statuses.picture];
    }else{ // 无配图
        self.pictureImageView.hidden = true;
    }
}

@end
