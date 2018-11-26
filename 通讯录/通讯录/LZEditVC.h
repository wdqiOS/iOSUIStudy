//
//  LZEditVC.h
//  通讯录
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LZContactItem;

@interface LZEditVC : UIViewController

/** contactItem */
@property(nonatomic, strong) LZContactItem *contactItem;

@end

NS_ASSUME_NONNULL_END
