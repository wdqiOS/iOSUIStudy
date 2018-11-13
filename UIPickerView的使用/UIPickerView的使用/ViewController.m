//
//  ViewController.m
//  UIPickerView的使用
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
/** pickView */
@property (strong, nonatomic) IBOutlet UIView *pickView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 设置数据源
    // 2. 设置代理
}

#pragma mark --------------------
#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
// 多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
// 每一列多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}
#pragma mark --------------------
#pragma mark - UIPickerViewDelegate

// returns width of column and height of row for each component.
// 每一列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 100;
}
// 每一行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
// 每一行展示的内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return @"LZ";
    }else{
        return @"WDQ";
    }
}
// 每行展示什么内容，带有属性的字符串（大小，颜色，阴影，描边）
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//
//}
// 每一行展示什么视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    if(component == 0){
        return [UIButton buttonWithType:UIButtonTypeInfoDark];
    }
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

// 当前选中的哪一列哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%ld ------- %ld", component, row);
}


@end
