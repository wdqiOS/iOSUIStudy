//
//  LZContactItem.m
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZContactItem.h"

@implementation LZContactItem

+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone{
    LZContactItem *item = [[LZContactItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}

@end
