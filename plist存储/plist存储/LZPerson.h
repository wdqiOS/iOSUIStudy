//
//  LZPerson.h
//  plist存储
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZPerson : NSObject

/** 名字 */
@property(nonatomic, strong) NSString *name;

/** 年龄 */
@property(nonatomic, assign) NSInteger age;

@end

NS_ASSUME_NONNULL_END
