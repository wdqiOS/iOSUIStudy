//
//  LZFlagItem.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZFlagItem.h"

@implementation LZFlagItem

+(instancetype)itemWithDict:(NSDictionary *)dict{
    LZFlagItem *item = [[super alloc] init];
//    [item setValuesForKeysWithDictionary:dict];
    // setValuesForKeysWithDictionary实现原理
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@ ---- %@", key, obj);
        [item setValue:obj forKeyPath:key];
    }];
    return item;
}

/*
 [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
 NSLog(@"%@ ---- %@", key, obj);
 [item setValue:obj forKeyPath:key];
 }];
 [item setValue:obj forKeyPath:key];
 setValue:forKeyPath实现原理：
 1. 先查看有没有对应key值的set方法，如果有set方法，就会调用set方法，给对应的属性赋值
 2. 如果没有set方法，去查看有没有跟key值相同并且带有下划线的成员属性，如果有的话，就给带有下划线的成员属性赋值
 3. 如果没有key值相同并且带有下划线的成员属性，还会去找有没有跟key值相同名称的成员属性，如果有，给它赋值
 4. 如果没有直接报错
 */

-(void)setIcon:(UIImage *)icon{
    NSString *imageName = (NSString *)icon;
    _icon = [UIImage imageNamed:imageName];
}

@end
