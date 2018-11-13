//
//  LZFlagItem.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZFlagItem.h"

@implementation LZFlagItem

+(instancetype)itemWithDict:(NSDictionary *)dict{
    LZFlagItem *item = [[super alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

@end
