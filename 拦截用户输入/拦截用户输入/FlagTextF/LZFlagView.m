//
//  LZFlagView.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZFlagView.h"
#import "LZFlagItem.h"



@interface LZFlagView ()

// 国家姓名
@property (weak, nonatomic) IBOutlet UILabel *nameL;
// 过期icon
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

@end

@implementation LZFlagView

+(instancetype)flagView{
    return [[[NSBundle mainBundle] loadNibNamed:@"LZFlagView" owner:nil options:nil] lastObject];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80);
}

-(void)setItem:(LZFlagItem *)item{
    _item = item;
    self.nameL.text = item.name;
    self.flagImageView.image = [UIImage imageNamed:item.icon];
}

@end
