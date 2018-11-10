//
//  LZPerson.m
//  模拟通知
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPerson.h"

@implementation LZPerson

-(void)getNews:(NSNotification *)noti{
    NSLog(@"[%@]接收到了[%@]发布的[%@]通知，通知的内容时：[%@]", self.name, [noti.object name], noti.name, noti.userInfo);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s", __func__);
}

@end
