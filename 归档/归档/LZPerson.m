//
//  LZPerson.m
//  归档
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPerson.h"
#import "LZDog.h"


@implementation LZPerson

// 在保存对象时告诉要保存当前对象的哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.dog forKey:@"dog"];
}

// 当解析一个文件的时候调用(告诉当前要解析文件的哪些属性)
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.age = [aDecoder decodeIntegerForKey:@"age"];
//        self.dog = [aDecoder decodeObjectForKey:@"dog"];
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"name"];
        self.age = (NSInteger)[aDecoder decodeObjectOfClass:[NSString class] forKey:@"age"];
        self.dog = [aDecoder decodeObjectOfClass:[LZDog class] forKey:@"dog"];
        
    }
    return self;
}

// 安全code
+(BOOL)supportsSecureCoding{
    return true;
}




@end
