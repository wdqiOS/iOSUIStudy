//
//  LZPerson.m
//  KVC的使用
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZPerson.h"

@implementation LZPerson
{
    CGFloat _height;
}

-(instancetype)init{
    if (self = [super init]) {
        [self setValue:@"5" forKey:@"_height"];
        [self printHeight];
    }
    return self;
}

-(void)printHeight{
    NSLog(@"身高：%f", _height);
}


-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
//        self.name = dict[@"name"];
//        self.money = [dict[@"money"] floatValue];
        
        // 使用KVC赋值
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)personWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name : %@  age === %zd  money === %f", _name, _age, _money];
}

@end
