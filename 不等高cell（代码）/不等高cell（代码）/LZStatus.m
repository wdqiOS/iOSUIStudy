//
//  LZStatus.m
//  不等高cell（代码）
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZStatus.h"

@implementation LZStatus

-(CGFloat)cellHeight{
    if (_cellHeight == 0) {
        CGFloat space = 10;
        // 图像
        CGFloat iconX = space;
        CGFloat iconY = space;
        CGFloat iconWH = 30;
        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        // 昵称
        CGFloat nameX = CGRectGetMaxX(self.iconFrame) + space;
        CGFloat nameY = iconY;
        // 计算昵称文字的尺寸
        NSDictionary *nameAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nameSize = [self.name sizeWithAttributes:nameAtt];
        CGFloat nameW = nameSize.width;
        CGFloat nameH = nameSize.height;
        self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
        
        // vip
        if(self.isVip){
            CGFloat vipX = CGRectGetMaxX(self.nameFrame) + space;
            CGFloat vipW = 14;
            CGFloat vipH = nameH;
            CGFloat vipY = nameY;
            self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
        }
        
        // 正文
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(self.iconFrame) + space;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2*space;
        CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        // 配图
        if (self.picture) {
            CGFloat pictureWH = 100;
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(self.textFrame) + space;
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
            _cellHeight = CGRectGetMaxY(self.pictureFrame) + space;
        }else{
            _cellHeight = CGRectGetMaxY(self.textFrame) + space;
        }
        
    }
    return _cellHeight;
}

@end
