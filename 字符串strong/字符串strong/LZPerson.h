//
//  LZPerson.h
//  字符串strong
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZPerson : NSObject

// 外界修改了字符串，不会影响里面
/** 名称 */
@property(nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
