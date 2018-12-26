//
//  LZSettingGroup.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/27.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZSettingGroup.h"

@implementation LZSettingGroup

+(instancetype)grougWithItems:(NSArray *)items{
    LZSettingGroup *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}

@end
