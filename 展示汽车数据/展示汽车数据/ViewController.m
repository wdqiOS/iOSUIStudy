//
//  ViewController.m
//  展示汽车数据
//
//  Created by 汪大强 on 2018/10/17.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZCarGroup.h"
#import "LZCar.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

/** 所有的车数据 */
@property(nonatomic, strong) NSArray *carGroup;
@end

@implementation ViewController

// plist
-(NSArray *)carGroup{
    if (_carGroup == nil) {
//        LZCarGroup *group0 = [[LZCarGroup alloc] init];
//        group0.header = @"德系品牌";
//        group0.footer = @"德系品牌简介";
//        group0.cars = @[
//                        [LZCar carWithName:@"奔驰" icon:@"TestImage"],
//                        [LZCar carWithName:@"宝马" icon:@"TestImage"],
//                        ];
//
//        LZCarGroup *group1 = [[LZCarGroup alloc] init];
//        group1.header = @"日系品牌";
//        group1.footer = @"日系品牌简介";
//        group1.cars = @[
//                        [LZCar carWithName:@"丰田" icon:@"TestImage"],
//                        [LZCar carWithName:@"马自达" icon:@"TestImage"],
//                        [LZCar carWithName:@"本田" icon:@"TestImage"],
//                        ];
//        _carGroup = @[group0, group1];
        
        // 1. 加载字典数组
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
//        // 2. 字典转模型
//        NSMutableArray *tmpArray = [NSMutableArray array];
//        for (NSDictionary *carGroupDict in dictArray) {
//            LZCarGroup *group = [LZCarGroup carGroupWithDict:carGroupDict];
//            [tmpArray addObject:group];
//        }
//        _carGroup = tmpArray;
        // 告诉MJExtension这个框架LZCarGroup的cars数组属性装的是LZCar对象
        [LZCarGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"cars" : [LZCar class]};
        }];
        _carGroup = [LZCarGroup mj_objectArrayWithFilename:@"cars.plist"];
    }
    return _carGroup;
}


// 业务逻辑
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark --------------------
#pragma mark - UITableViewDataSource 协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroup.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.carGroup[section] cars] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // 设置右边的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 自定义右边的样式
//    cell.accessoryView = [[UISwitch alloc] init];
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            cell.textLabel.text = @"奔驰";
//            cell.imageView.image = [UIImage imageNamed:@"TestImage"];
//        }else{
//            cell.textLabel.text = @"宝马";
//            cell.imageView.image = [UIImage imageNamed:@"TestImage"];
//        }
//    }else if(indexPath.section == 1){
//        if (indexPath.row == 0) {
//            cell.textLabel.text = @"丰田";
//            cell.imageView.image = [UIImage imageNamed:@"TestImage"];
//        }else if(indexPath.row == 1){
//            cell.textLabel.text = @"马自达";
//            cell.imageView.image = [UIImage imageNamed:@"TestImage"];
//        }else if(indexPath.row == 2){
//            cell.textLabel.text = @"本田";
//            cell.imageView.image = [UIImage imageNamed:@"TestImage"];
//        }
//    }
    
    LZCar *car = [[[self.carGroup objectAtIndex:indexPath.section] cars] objectAtIndex:indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}



/**
 告诉tableviewd每一组的头部标题

 @param tableView tableview对象
 @param section 段
 @return 头部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.carGroup[section] title];
}

/**
 告诉tableviewd每一组的尾部标题
 
 @param tableView tableview对象
 @param section 段
 @return 尾部标题
 */
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return [self.carGroup[section] footer];
}


@end
