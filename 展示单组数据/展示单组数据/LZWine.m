//
//  LZWine.m
//  展示单组数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZWine.h"

@implementation LZWine

+(instancetype)wineWithDict:(NSDictionary *)dict{
    LZWine *wine = [[self alloc] init];
    [wine setValuesForKeysWithDictionary:dict];
    
    return wine;
}

@end
