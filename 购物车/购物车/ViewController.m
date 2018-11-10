//
//  ViewController.m
//  购物车
//
//  Created by 汪大强 on 2018/11/10.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTgCell.h"
#import "LZTg.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

/** tg数据 */
@property(nonatomic, strong) NSMutableArray<LZTg*> *tgArrays;
/** 总价label */
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
/** 购买按钮 */
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
/** 清空购物车 */
@property (weak, nonatomic) IBOutlet UIButton *clearShops;


@end

@implementation ViewController

-(NSMutableArray<LZTg *> *)tgArrays{
    if (_tgArrays == nil) {
        _tgArrays = [LZTg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIView *footer = [[UIView alloc] init];
//    footer.backgroundColor = UIColor.redColor;
//    footer.frame = CGRectMake(0, 0, 0, 44);
//    self.tableview.tableHeaderView = footer;
    
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    // 预估高度
    self.tableview.estimatedRowHeight = 44;
    
    // 监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addClick:) name:@"addClickNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(minusClick:) name:@"minusClickNotification" object:nil];
}

#pragma mark --------------------
#pragma mark - 通知
-(void)addClick:(NSNotification *)note{
    NSLog(@"%s", __func__);
    LZTgCell *cell = note.object;
    // 计算总价
    int totalPrice = self.totalPriceLabel.text.intValue + cell.tg.price.intValue;
    // 设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    self.buyButton.enabled = true;
    self.clearShops.enabled = true;
    
}
-(void)minusClick:(NSNotification *)note{
    NSLog(@"%s", __func__);
    LZTgCell *cell = note.object;
    // 计算总价
    int totalPrice = self.totalPriceLabel.text.intValue - cell.tg.price.intValue;
    // 设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    self.buyButton.enabled = (totalPrice > 0);
    self.clearShops.enabled = (totalPrice > 0);
}

#pragma mark --------------------
#pragma mark - 购买或清空

- (IBAction)buy {
    
}

- (IBAction)clearShopsClick {
    // 总价清零
    self.totalPriceLabel.text = @"0";
    // 1. 遍历数据
    for (LZTg *tg in self.tgArrays) {
        if (tg.count > 0) {
            tg.count = 0;
        }
    }
    // 2. 刷新表格
    [self.tableview reloadData];
    
    // 设置购买按钮和清空购物车按钮不能点击
    self.buyButton.enabled = false;
    self.clearShops.enabled = false;
}




#pragma mark --------------------
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgArrays.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"tgcell";
    LZTgCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[LZTgCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//    }
    cell.tg = self.tgArrays[indexPath.row];
    return cell;
}

#pragma mark --------------------
#pragma mark - UITableViewDelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 70;
//}


@end
