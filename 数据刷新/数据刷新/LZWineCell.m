//
//  LZWineCell.m
//  数据刷新
//
//  Created by 汪大强 on 2018/11/9.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWineCell.h"
#import "LZTg.h"

@interface LZWineCell ()

/** 打钩控件 */
@property(nonatomic, weak) UIImageView *checkedImageView;

@end

@implementation LZWineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加打钩控件
        UIImageView *checkedImageView = [[UIImageView alloc] init];
        checkedImageView.image = [UIImage imageNamed:@"1.jpg"];
        checkedImageView.hidden = true;
        [self.contentView addSubview:checkedImageView];
        self.checkedImageView = checkedImageView;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // 设置打钩的位置及尺寸
    CGFloat WH = 24;
    CGFloat X = self.contentView.frame.size.width - WH - 10;
    CGFloat Y = (self.contentView.frame.size.height - WH)*0.5;
    self.checkedImageView.frame = CGRectMake(X, Y, WH, WH);
    self.checkedImageView.layer.cornerRadius = WH*0.5;
    self.checkedImageView.layer.masksToBounds = true;
    
    // 调整textlabel的宽度
    CGRect frame = self.textLabel.frame;
    frame.size.width = X - 10 - frame.origin.x;
    self.textLabel.frame = frame;
}

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
    
    self.imageView.image = [UIImage imageNamed:tg.icon];
    self.textLabel.text = tg.title;
    self.detailTextLabel.text = tg.price;
    

    // 判断打钩控件是否显示
    self.checkedImageView.hidden = !tg.isChecked;
}

@end
