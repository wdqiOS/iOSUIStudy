//
//  LZContactItem.h
//  通讯录
//
//  Created by 汪大强 on 2018/11/14.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZContactItem : NSObject

/** 姓名 */
@property(nonatomic, strong) NSString *name;
/** 电话 */
@property(nonatomic, strong) NSString *phone;

/** 根据传入的姓名和电话快速创建联系人模型 */
+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone;

@end

NS_ASSUME_NONNULL_END
