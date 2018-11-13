//
//  ViewController.m
//  UIPickView的DEMO
//
//  Created by 汪大强 on 2018/11/13.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
/** pickerview */
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/** 存放加载的数据 */
@property(nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        _dataArray = [NSArray arrayWithContentsOfFile:path];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    
}


#pragma mark --------------------
#pragma mark - UIPickerViewDataSource
// 展示多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.dataArray.count;
}

// 每一列展示多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataArray[component] count];
}

#pragma mark --------------------
#pragma mark - UIPickerViewDelegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *array = self.dataArray[component];
    return array[row];
}

// 当前选中的哪一行哪一列
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *title = self.dataArray[component][row];
    self.titleLabel.text = title;
}

@end
