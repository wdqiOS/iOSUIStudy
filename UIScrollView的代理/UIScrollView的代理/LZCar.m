//
//  LZCar.m
//  UIScrollView的代理
//
//  Created by 汪大强 on 2018/10/9.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZCar.h"

@interface LZCar ()

@end

@implementation LZCar


#pragma mark --------------------
#pragma mark - scrollview代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%s", __func__);
}


-(void)dealloc{
    NSLog(@"%s", __func__);
}
@end
