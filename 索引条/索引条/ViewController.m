//
//  ViewController.m
//  索引条
//
//  Created by 汪大强 on 2018/10/19.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZCarGroup.h"
#import "LZCar.h"

@interface ViewController ()

/** 所有的车数据 */
@property(nonatomic, strong) NSArray *carGroups;

@end

@implementation ViewController

-(NSArray *)carGroups{
    if (_carGroups == nil) {
        // 1. 加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        // 2. 字典数组-->模型数组
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *carGroupDict in dictArray) {
            [temp addObject:[LZCarGroup carGroupWithDict:carGroupDict]];
        }
        _carGroups = temp;
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置索引条的文字颜色
    self.tableView.sectionIndexColor = UIColor.redColor;
    // 设置索引条的背景颜色
    self.tableView.sectionIndexBackgroundColor = UIColor.yellowColor;
    
    self.tableView.sectionIndexTrackingBackgroundColor = UIColor.blueColor;
}

// 隐藏电池栏
-(BOOL)prefersStatusBarHidden{
    return true;
}

#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.carGroups[section] cars] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1. 访问缓存池
    static NSString *ID = @"car";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2. 缓存池中没有，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 3. 设置数据
    LZCarGroup *group = self.carGroups[indexPath.section];
    LZCar *car = group.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.carGroups[section] title];
}


/**
 返回索引条的文字

 @param tableView tableview对象
 @return 索引条值
 */
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *titles = [NSMutableArray array];
//    for (LZCarGroup *group in self.carGroups) {
//        [titles addObject:group.title];
//    }
//    return titles;
    
    // 抽取self.carGroups 这个数组中每一元素（LZCarGroup对象）的title属性的值，放在一个新的数组中返回
    return [self.carGroups valueForKey:@"title"];
}

@end
