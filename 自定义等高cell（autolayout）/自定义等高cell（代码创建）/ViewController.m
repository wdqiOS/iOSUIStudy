//
//  ViewController.m
//  自定义等高cell（代码创建）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTgCell.h"
#import "LZTg.h"

// cell 复用标识
static NSString *ID = @"tg";
@interface ViewController ()

/** 所有的团购数据 */
@property(nonatomic, strong) NSArray *tgs;

@end

@implementation ViewController

-(NSArray *)tgs{
    if (_tgs == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *tgDict in dictArray) {
            [temp addObject:[LZTg tgWithDict:tgDict]];
        }
        _tgs = temp;
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 70;
    // 注册cell
    [self.tableView registerClass:[LZTgCell class] forCellReuseIdentifier:ID];
}

#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 访问缓存池
    LZTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(cell == nil){
//        cell = [[LZTgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }

    // 设置数据(传递模型)
    cell.tg = self.tgs[indexPath.row];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
//
//    LZTg *tg = self.tgs[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:tg.icon];
    
    
    return cell;
}


@end
