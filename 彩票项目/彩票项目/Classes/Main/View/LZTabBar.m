//
//  LZTabBar.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/23.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTabBar.h"
#import "LZTabBarButton.h"

@interface LZTabBar ()

/** 记录选中的按钮 */
@property(nonatomic, weak) UIButton *selectButton;

@end

@implementation LZTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

#pragma mark --------------------
#pragma mark - 重写countset方法
//-(void)setCount:(NSInteger)count{
//    _count = count;
//    for (int i = 0; i < count; i++) {
//        // 添加子控件
//        UIButton *button = [[UIButton alloc] init];
//        [self addSubview:button];
//
//    }
//}

-(void)setItems:(NSArray *)items{
    _items = items;
    for (int i = 0; i < items.count; i++) {
        // 添加子控件
        LZTabBarButton *button = [[LZTabBarButton alloc] init];
        [self addSubview:button];
        button.tag = i;
        UITabBarItem *item = (UITabBarItem *)items[i];
        [button setBackgroundImage:item.image forState:UIControlStateNormal];
//        [button setImage:item.image forState:UIControlStateNormal];
//        [button setImage:item.selectedImage forState:UIControlStateSelected];
        [button setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        [button sizeToFit];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
    }
}

#pragma mark --------------------
#pragma mark - tabbar按钮点击事件
-(void)buttonClick:(UIButton *)button{
    // 1. 取消上次选中
    self.selectButton.selected = false;
    // 2. 选中当前点击的按钮
    button.selected = YES;
    // 3. 记录当前选中的按钮
    self.selectButton = button;
    // 4. 通知外界切换子控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:index:)]) {
        [self.delegate tabBar:self index:button.tag];
    }
}


#pragma mark --------------------
#pragma mark - 设置尺寸
-(void)layoutSubviews{
    [super layoutSubviews];
    // 调整子控件的frame
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = 49;
    int i = 0;
    for (UIButton *button in self.subviews) {
        buttonX = buttonW * i;
        if (i == 0) {
            [self buttonClick:button];
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        i++;
//        buttonX += buttonW;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
