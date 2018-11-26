//
//  LZProvinceTextF.m
//  拦截用户输入
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZProvinceTextF.h"
#import "LZProvinceItem.h"

@interface LZProvinceTextF ()<UIPickerViewDelegate, UIPickerViewDataSource>

/** 加载的省份 */
@property(nonatomic, strong) NSArray *dataArray;

/** 当前选中的第一列的多少行下标 */
@property(nonatomic, assign) NSInteger proIndex;

/** pickerView */
@property(nonatomic, weak)  UIPickerView *picker;

@end

@implementation LZProvinceTextF

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            // 字典转模型
            LZProvinceItem *item = [LZProvinceItem itemWithDict:dict];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    // 初始化
    [self setUp];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        // 初始化
        [self setUp];
    }
    return self;
}

// 初始化
-(void)setUp{
    // 创建pickerview
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    self.picker = picker;
    
    self.inputView = picker;
    
    // 初始化文本框内容
//    [self initWithText];
    
}

#pragma mark --------------------
#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    // 当前选中的第一列的多少行
    NSLog(@"%zd ---- %zd", component, row);
    if (component == 0) {
        self.proIndex = row;
        
        // 第一列选中第0行
        [pickerView selectRow:0 inComponent:1 animated:true];
        // 刷新数据
        [pickerView reloadAllComponents];
    }
    // 取出当前选中的省份
    LZProvinceItem *item = self.dataArray[self.proIndex];
    // 获取第1列选中的行
    NSInteger cityRow = [pickerView selectedRowInComponent:1];
    self.text = [NSString stringWithFormat:@"%@ %@", item.State, item.Cities[cityRow][@"city"]];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        LZProvinceItem *item = self.dataArray[row];
        return item.State;
    }else{
        LZProvinceItem *item = self.dataArray[self.proIndex];
        return item.Cities[row][@"city"];
    }
}

#pragma mark --------------------
#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return self.dataArray.count;
    }else{
        // 当前选中的省份决定
        return [[self.dataArray[self.proIndex] Cities] count];
    }
}


#pragma mark --------------------
#pragma mark - 初始化文本框文字（选中第0行）
-(void)initWithText{
    self.proIndex = 0;
    [self pickerView:self.picker didSelectRow:0 inComponent:0];
}

@end
