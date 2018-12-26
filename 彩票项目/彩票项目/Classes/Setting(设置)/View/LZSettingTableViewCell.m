//
//  LZSettingTableViewCell.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZSettingTableViewCell.h"


@implementation LZSettingTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    return [self cellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
}

+(instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style{
    static NSString *ID = @"cell";
    LZSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LZSettingTableViewCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}


-(void)setItem:(LZSettingItem *)item{
    _item = item;
    self.imageView.image = item.icon;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    [self setupRightView];
}

// 设置右侧视图
-(void)setupRightView{
    if ([_item isKindOfClass:[LZSettingArrowItem class]]) {
        // 右侧视图是箭头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([_item isKindOfClass:[LZSettingSwitchItem class]]){
        // 右侧是开关
        UISwitch *switchOn = [[UISwitch alloc] init];
        switchOn.on = [(LZSettingSwitchItem *)_item isOn];
        self.accessoryView = switchOn;
    }else{ // 不展示任何视图
        self.accessoryView = nil;
    }
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
