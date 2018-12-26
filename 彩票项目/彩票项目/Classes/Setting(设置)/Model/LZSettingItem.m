//
//  LZSettingItem.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZSettingItem.h"

@implementation LZSettingItem

+(instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title{
    LZSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithIcon:nil title:title];
}

@end
