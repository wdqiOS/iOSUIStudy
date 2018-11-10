//
//  LZCar.m
//  索引条
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZCar.h"

@implementation LZCar

+(instancetype)carWithDict:(NSDictionary *)dict{
    LZCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}

@end
