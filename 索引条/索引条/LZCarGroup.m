//
//  LZCarGroup.m
//  索引条
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCarGroup.h"
#import "LZCar.h"

@implementation LZCarGroup

+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    LZCarGroup *carGroup = [[self alloc] init];
    carGroup.title = dict[@"title"];
    // 字典数组-->模型数组
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        LZCar *car = [LZCar carWithDict:carDict];
        [tmpArray addObject:car];
    }
    carGroup.cars = tmpArray;
    return carGroup;
}

@end
