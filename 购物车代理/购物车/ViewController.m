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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, LZTgCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

/** tg数据 */
@property(nonatomic, strong) NSMutableArray<LZTg*> *tgArrays;
/** 总价label */
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
/** 购买按钮 */
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
/** 清空购物车 */
@property (weak, nonatomic) IBOutlet UIButton *clearShops;

/** 购物车对象 */
@property(nonatomic, strong) NSMutableArray *shoppingCar;

@end

@implementation ViewController

-(NSMutableArray *)shoppingCar{
    if (_shoppingCar == nil) {
        _shoppingCar = [NSMutableArray array];
    }
    return _shoppingCar;
}

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
    

}


#pragma mark --------------------
#pragma mark - KVO的
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(LZTg *)tg change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
 NSLog(@"%@ ---- %@ --- %@", keyPath, tg, change);
    // 新值 NSKeyValueChangeNewKey == @"new"
    int new = [change[NSKeyValueChangeNewKey] intValue];
    // 旧值 NSKeyValueChangeOldKey == @“old”
    int old = [change[NSKeyValueChangeOldKey] intValue];
    if(new > old){ // 加
        // 计算总价
        int  totalPrice = self.totalPriceLabel.text.intValue + tg.price.intValue;
        // 设置总价
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
        
    }else{ // 减
        // 计算总价
        int  totalPrice = self.totalPriceLabel.text.intValue - tg.price.intValue;
        // 设置总价
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    }
    
    self.clearShops.enabled = (self.totalPriceLabel.text.intValue > 0);
    self.buyButton.enabled = (self.totalPriceLabel.text.intValue > 0);
    
}

#pragma mark --------------------
#pragma mark - 购买或清空

- (IBAction)buy {
    for (LZTg *tg in self.shoppingCar) {
        NSLog(@"tg === %@", tg);
    }
}

- (IBAction)clearShopsClick {
    
    // 1. 遍历数据
    for (LZTg *tg in self.shoppingCar) {
        if (tg.count > 0) {
            tg.count = 0;
        }
    }
    // 2. 刷新表格
    [self.tableview reloadData];
    
    // 总价清零
    self.totalPriceLabel.text = @"0";
    
    // 设置购买按钮和清空购物车按钮不能点击
    self.buyButton.enabled = false;
    self.clearShops.enabled = false;
    
    // 清空购物车
    [self.shoppingCar removeAllObjects];
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
    cell.delegate = self;
    cell.tg = self.tgArrays[indexPath.row];
    return cell;
}

#pragma mark --------------------
#pragma mark - UITableViewDelegate
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 70;
//}


#pragma mark --------------------
#pragma mark - 自定义LZTgCellDelegate的代理方法
-(void)tgCellDidClickAddButton:(LZTgCell *)cell{
    NSLog(@"%s", __func__);
    // 计算总价
    int  totalPrice = self.totalPriceLabel.text.intValue + cell.tg.price.intValue;
    // 设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    self.clearShops.enabled = true;
    self.buyButton.enabled = true;
    
    if (![self.shoppingCar containsObject:cell.tg]) {
         [self.shoppingCar addObject:cell.tg];
    }
   
    
}

-(void)tgCellDidClickMinusButton:(LZTgCell *)cell{
    NSLog(@"%s", __func__);
    // 计算总价
    int  totalPrice = self.totalPriceLabel.text.intValue - cell.tg.price.intValue;
    // 设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    self.clearShops.enabled = (totalPrice > 0);
    self.buyButton.enabled = (totalPrice > 0);
    if (totalPrice == 0) { // 移除用户不再购买的tg
        [self.shoppingCar removeObject:cell.tg];
    }
}

@end
