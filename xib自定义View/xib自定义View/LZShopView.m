//
//  LZShopView.m
//  xib自定义View
//
//  Created by 汪大强 on 2018/9/28.
//  Copyright © 2018年 LZ. All rights reserved.
//

#import "LZShopView.h"

@interface LZShopView ()
/** 商品icon */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 商品名称 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


/** 测试label */
@property(nonatomic, weak) UILabel *testLabel;

/** 毛玻璃 */
@property(nonatomic, weak) UIToolbar *toolBar;

@end

@implementation LZShopView

/*
 初始化方法：如果alloc初始化view，不会调用init或 initWithFrame: 方法
 */
/*
-(instancetype)init{
    if (self = [super init]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        NSLog(@"%s", __func__);
    }
    return self;
}
*/

// xib的初始化方法
/*
 如果view从xib中加载，就会调用initWithCoder: 方法
 创建子控件…………
 注意：如果子控件是从xib中创建，是处于未唤醒状态
 */
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        /*
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = UIColor.redColor;
        label.text = @"测试一下";
        [self addSubview:label];
        self.testLabel = label;
         */
        
        
    }
    return self;
}

#pragma mark --------------------
#pragma mark - 模拟 xib 的加载原理
/*
-(UIView *)loadFromNib{
    LZShopView *shopView = [[LZShopView alloc] initWithCoder:nil];
    shopView.frame = CGRectMake(0, 0, 80, 100);
    shopView.backgroundColor = UIColor.orangeColor;
    
    // 加载子控件
    UIImageView *iconView = [[UIImageView alloc] initWithCoder:nil];
    iconView.backgroundColor = UIColor.greenColor;
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.tag = 100;
    [shopView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *titleLabel = [[UILabel alloc] initWithCoder:nil];
    titleLabel.backgroundColor = UIColor.redColor;
    titleLabel.tag = 200;
    [shopView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    return shopView;
}
*/

/*
 从xib中唤醒
 添加xib中创建的子控件的子控件
 */
-(void)awakeFromNib{
    [super awakeFromNib];
    // imageview上加毛玻璃
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    [self.iconView addSubview:toolBar];
    self.toolBar = toolBar;
}

#pragma mark --------------------
#pragma mark - 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    /*
    self.testLabel.frame = self.bounds;
     */
    self.toolBar.frame = self.iconView.bounds;
}

#pragma mark --------------------
#pragma mark - 快速构造方法
+(instancetype)shopView{
    return [[[NSBundle mainBundle] loadNibNamed:@"LZShopView" owner:nil options:nil] firstObject];
}

#pragma mark --------------------
#pragma mark - 设置数据
-(void)setIcon:(NSString *)icon{
    self.iconView.image = [UIImage imageNamed:icon];
}

-(void)setName:(NSString *)name{
    self.titleLabel.text = name;
}

@end
