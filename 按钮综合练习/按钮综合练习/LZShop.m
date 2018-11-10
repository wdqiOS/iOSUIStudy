//
//  Shop.m
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/26.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZShop.h"

@implementation LZShop
/**
-(instancetype)initWithIcon:(NSString *)icon name:(NSString *)name{
    if (self = [super init]) {
        self.name = name;
        self.icon = icon;
    }
    return self;
}

+(instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name{
    return [[self alloc] initWithIcon:icon name:name];
}
*/
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+(instancetype)shopWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
