//
//  LZPerson.m
//  字符串strong
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPerson.h"

@implementation LZPerson

-(void)setName:(NSString *)name{
    // 字符串如果能确定是不可变，可以使用strong，性能优化，少一步copy操作！！！！！！
    _name = [name copy];
}

@end
