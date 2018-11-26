//
//  LZDateTextF.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZDateTextF.h"

@interface LZDateTextF ()

/** datePicker */
@property(nonatomic, weak) UIDatePicker *datePick;

@end

@implementation LZDateTextF

-(void)awakeFromNib{
    [super awakeFromNib];
    // 初始化
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 初始化
        [self setUp];
    }
    return self;
}

// 初始化
-(void)setUp{
    UIDatePicker *datePick = [[UIDatePicker alloc] init];
    // 修改datePick日期模式
    datePick.datePickerMode = UIDatePickerModeDate;
    datePick.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    self.datePick = datePick;
    
    // 监听日期改变
    [datePick addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    // 日期键盘
    self.inputView = datePick;
    
    // 初始化文本框内容
//    [self initWithText];
}

-(void)dateChange:(UIDatePicker *)datePick{
    // 把当前的日期给文本框赋值
    // 获取当前选中的日期
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 把当前日期转成字符串
    NSString *date = [fmt stringFromDate:datePick.date];
    
    self.text = date;
}

#pragma mark --------------------
#pragma mark - 初始化文本框文字（选中第0行）
-(void)initWithText{
    [self dateChange:self.datePick];
}

@end
