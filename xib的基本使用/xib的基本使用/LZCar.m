//
//  LZCar.m
//  xib的基本使用
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZCar.h"

@implementation LZCar

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.image = dict[@"image"];
        self.title = dict[@"title"];
        self.subTitle = dict[@"subtitle"];
        self.follow = dict[@"follow"];
    }
    return self;
}

+(instancetype)carWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
