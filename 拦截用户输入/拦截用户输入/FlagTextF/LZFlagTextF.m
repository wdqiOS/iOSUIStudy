//
//  LZFlagTextF.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZFlagTextF.h"
#import "LZFlagItem.h"
#import "LZFlagView.h"

@interface LZFlagTextF ()<UIPickerViewDelegate, UIPickerViewDataSource>

/** 加载的数据 */
@property(nonatomic, strong) NSArray *dataArray;

/** pickerView */
@property(nonatomic, weak) UIPickerView *pick;

@end

@implementation LZFlagTextF

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        // 把数组当中的字典转成模型
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            LZFlagItem *item = [LZFlagItem itemWithDict:dic];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}
// 只要从xib或者storyboard加载就会调用这个方法，只会调用一次
-(void)awakeFromNib{
    [super awakeFromNib];
    // 初始化文本框
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化文本框
        [self setUp];
    }
    return self;
}

// 初始化文本框
-(void)setUp{
    // 创建UIPickerView
    UIPickerView *pick = [[UIPickerView alloc] init];
    pick.delegate = self;
    pick.dataSource = self;
    self.pick = pick;
    
    // 修改文本框弹出键盘类型
    self.inputView = pick;
    
    // 初始化文本框内容
//    [self initWithText];
}

#pragma mark --------------------
#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}
#pragma mark --------------------
#pragma mark - UIPickerViewDelegate
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    LZFlagView *flagView = [LZFlagView flagView];
    // 取出当前行的模型
    LZFlagItem *item = self.dataArray[row];
    flagView.item = item;
    return flagView;
}

// pickerview的行高
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 80;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"country ==== %@", [self.dataArray[row] name]);
    self.text = [self.dataArray[row] name];
}

#pragma mark --------------------
#pragma mark - 初始化文本框文字（选中第0行）
-(void)initWithText{
    [self pickerView:self.pick didSelectRow:0 inComponent:0];
}

@end
