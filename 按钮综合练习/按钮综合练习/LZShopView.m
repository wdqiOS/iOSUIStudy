//
//  LZShopView.m
//  按钮综合练习
//
//  Created by 汪大强 on 2018/9/27.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZShopView.h"
#import "LZShop.h"

@interface LZShopView ()

/** 图片控件 */
@property(nonatomic, weak) UIImageView *iconView;

/** 标题控件 */
@property(nonatomic, weak) UILabel *titleLabel;

@end

@implementation LZShopView

/*
 初始化子控件
 */
//-(instancetype)init{
//    if (self = [super init]) {
//        [self setUp];
//    }
//    return self;
//}

/*
 注意：创建对象用 [[xxx alloc] init] 和 [[xxx alloc] initWithFrame: frame] 方法都会调用initWithFrame：
 */
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithShop:(LZShop *)shop{
    if (self = [super init]) {
        // 注意：先创建后赋值
        [self setUp];
        self.shop = shop;
    }
    return self;
}

+(instancetype)shopViewWithShop:(LZShop *)shop{
    return [[self alloc] initWithShop:shop];
}

-(void)setUp{
    // 1. 创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = UIColor.blueColor;
    [self addSubview:iconView];
    self.iconView = iconView;
    
    // 2. 创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = UIColor.yellowColor;
    titleLabel.textAlignment = NSTextAlignmentCenter; // 居中
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

/*
    可以拿到frame
 */
-(void)layoutSubviews{
    // 0. 一定要调用super
    [super layoutSubviews];
    // 1. 获取当前控件的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 2、设置子控件的frame
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}


/**
 set方法：只要外边传数据就会调用
 作用：设置数据

 @param shop 数据模型
 */
-(void)setShop:(LZShop *)shop{
    _shop = shop;
    
    // 设置数据
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}


/**
-(void)setIcon:(NSString *)icon{
    // 设置数据
    self.iconView.image = [UIImage imageNamed:icon];
}

-(void)setName:(NSString *)name{
    // 设置数据
    self.titleLabel.text = name;
}
*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
