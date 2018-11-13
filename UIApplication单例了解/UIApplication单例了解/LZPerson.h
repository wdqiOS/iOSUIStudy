//
//  LZPerson.h
//  UIApplication单例了解
//
//  Created by 汪大强 on 2018/11/12.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZPerson : NSObject

+(instancetype)sharedPerson;


@end

NS_ASSUME_NONNULL_END
