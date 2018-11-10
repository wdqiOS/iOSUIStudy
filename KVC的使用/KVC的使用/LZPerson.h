//
//  LZPerson.h
//  KVC的使用
//
//  Created by 汪大强 on 2018/9/30.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LZDog;
NS_ASSUME_NONNULL_BEGIN

@interface LZPerson : NSObject

/** 姓名 */
@property(nonatomic, copy) NSString *name;
/** 年龄 */
@property(nonatomic, assign) NSInteger age;

/** 钱 */
@property(nonatomic, assign) CGFloat money;


/** 狗 */
@property(nonatomic, strong) LZDog *dog;

// 打印身高
-(void)printHeight;

-(instancetype)initWithDict: (NSDictionary *)dict;
+(instancetype)personWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
