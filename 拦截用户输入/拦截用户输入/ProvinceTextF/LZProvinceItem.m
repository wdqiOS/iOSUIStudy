//
//  LZProvinceItem.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZProvinceItem.h"

@implementation LZProvinceItem

+(instancetype)itemWithDict:(NSDictionary *)dict{
    LZProvinceItem *item = [[LZProvinceItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

@end
