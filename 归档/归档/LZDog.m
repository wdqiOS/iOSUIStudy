//
//  LZDog.m
//  归档
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDog.h"

@implementation LZDog

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
        // iOS12 解码的方式
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"name"];
    }
    return self;
}

+(BOOL)supportsSecureCoding{
    return YES;
}

@end
