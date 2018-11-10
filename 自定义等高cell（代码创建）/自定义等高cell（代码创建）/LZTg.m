//
//  LZTg.m
//  自定义等高cell（代码创建）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTg.h"

@implementation LZTg

+(instancetype)tgWithDict:(NSDictionary *)dict{
    LZTg *tg = [[self alloc] init];
    [tg setValuesForKeysWithDictionary:dict];
    
    return tg;
}

@end
