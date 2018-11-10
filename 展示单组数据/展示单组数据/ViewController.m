//
//  ViewController.m
//  展示单组数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZWine.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
/** tableview */
@property (weak, nonatomic) IBOutlet UITableView *tableview;

/** 所有的酒数据 */
@property(nonatomic, strong) NSArray *wineArray;

@end

@implementation ViewController

-(NSArray *)wineArray{
    if (_wineArray == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *wineDict in dictArray) {
            [temp addObject:[LZWine wineWithDict:wineDict]];
        }
        _wineArray = temp;
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置tableview每一行的高度
    self.tableview.rowHeight = 80.f;
    
    // 设置tableview每一组的头部高度
    self.tableview.sectionHeaderHeight = 80.f;
    // 设置tableview每一组的尾部高度
    self.tableview.sectionFooterHeight = 80.f;
    
    // 设置分割线的颜色
    self.tableview.separatorColor = UIColor.redColor;
//    self.tableview.separatorColor = UIColor.clearColor;
    
    // 设置分割线样式
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置表头控件
    self.tableview.tableHeaderView = [[UISwitch alloc] init];
    // 设置表尾控件
    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerBtn setTitle:@"测试一下" forState:UIControlStateNormal];
    [footerBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    footerBtn.frame = CGRectMake(0, 0, 100, 40);
    [footerBtn addTarget:self action:@selector(footerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.tableview.tableFooterView = footerBtn;
    
    
    // 设置UITableViewDelegate的代理
    self.tableview.delegate = self;
    
}

-(void)footerBtnClick:(UIButton *)btn{
    [self.tableview setContentOffset:CGPointMake(0, 0) animated:true];
}

#pragma mark --------------------
#pragma mark - UITableViewDataSource协议方法
// 不实现默认是一组
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}


// section == 0
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    // 设置右边显示的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 设置右边显示的控件
    cell.accessoryView = [[UISwitch alloc] init];
    // 设置选中样式
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 设置cell的背景颜色
//    cell.backgroundColor = UIColor.redColor;
    // 设置cell的背景view backgroundView的优先级大于backgroundColor的优先级
//    UIView *bgView = [[UIView alloc] init];
//    bgView.backgroundColor = UIColor.blueColor;
//    cell.backgroundView = bgView;
    
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = UIColor.greenColor;
    cell.selectedBackgroundView = selectedBg;
    
    LZWine *wine = self.wineArray[indexPath.row];
    cell.textLabel.text = wine.name;
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@", wine.money];
    cell.detailTextLabel.textColor = UIColor.orangeColor;
    
//    NSLog(@"%@", cell.contentView.subviews);
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"头部";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"尾部";
}

#pragma mark --------------------
#pragma mark - UITableViewDelegate协议方法

/**
 选中了某一行cell就会调用这个方法
 @param tableView tableview对象
 @param indexPath indexPath
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s  选中了：%zd行", __func__, indexPath.row);
}

/**
 取消选中了某一行cell就会调用这个方法
 @param tableView tableview对象
 @param indexPath indexPath
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s  取消选中了：%zd行", __func__, indexPath.row);
}


/**
 返回每一组的头部控件

 @param tableView tableview对象
 @param section 段
 @return 返回的控件对象
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UISwitch alloc] init];
}
/**
 返回每一组的尾部控件
 
 @param tableView tableview对象
 @param section 段
 @return 返回的控件对象
 */
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UISwitch alloc] init];
}


/**
 返回每一组的头部高度

 @param tableView tableview对象
 @param section section
 @return 返回的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

/**
 返回每一组的尾部高度
 
 @param tableView tableview对象
 @param section section
 @return 返回的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}


/**
 返回每一行cell的高度

 @param tableView tableview对象
 @param indexPath indexPath
 @return 返回的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.row % 2) {
        return 100;
    }
    return 50;
}

@end
