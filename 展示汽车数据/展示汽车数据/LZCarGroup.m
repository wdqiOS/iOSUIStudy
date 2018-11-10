//
//  LZCarGroup.m
//  展示汽车数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCarGroup.h"
#import "LZCar.h"

@implementation LZCarGroup

+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    LZCarGroup *group = [[self alloc] init];
    // kvc赋值
//    [group setValuesForKeysWithDictionary:dict];
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        LZCar *car = [LZCar carWithDict:carDict];
        [tmpArray addObject:car];
    }
    group.cars = tmpArray;
    return group;
}


// 模型中包含模型的时候，需要重写该方法
+(NSDictionary *)mj_objectClassInArray{
    return @{@"cars" : @"LZCar"};
}


@end
