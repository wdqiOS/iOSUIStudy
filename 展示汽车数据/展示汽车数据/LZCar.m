//
//  LZCar.m
//  展示汽车数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCar.h"

@implementation LZCar

+(instancetype)carWithName:(NSString *)name icon:(NSString *)icon{
    LZCar *car = [[self alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}

+(instancetype)carWithDict:(NSDictionary *)dict{
    LZCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}

@end
