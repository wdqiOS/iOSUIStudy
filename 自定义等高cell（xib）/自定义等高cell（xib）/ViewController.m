//
//  ViewController.m
//  自定义等高cell（xib）
//
//  Created by 汪大强 on 2018/10/20.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "ViewController.h"
#import "LZTgCell.h"
#import "LZTg.h"
#import "MJExtension.h"
#import "LZTestCell.h"
#import "LZStoryboardCell.h"

/** cell的高度是由tableview决定的，不设置默认是44 */

@interface ViewController ()

/** 团购数据 */
@property(nonatomic, strong) NSArray *tgs;

@end

static NSString *ID = @"tg";
static NSString *testID = @"test";
static NSString *storyboardID = @"storyboard";
@implementation ViewController

-(NSArray *)tgs{
    if (_tgs == nil) {
        _tgs = [LZTg mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置行高
    self.tableView.rowHeight = 70;
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZTgCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LZTestCell class]) bundle:nil] forCellReuseIdentifier:testID];
}

#pragma mark --------------------
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row % 4 == 0){
        LZTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        //    if (cell == nil) {
        // 没有复用标识，缓存池中取cell取不出来
        //        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LZTgCell class]) owner:nil options:nil] lastObject];
        //    }
        
        cell.tg = self.tgs[indexPath.row];
        
        return cell;
    }else if(indexPath.row % 4 == 1){
        LZTestCell *cell = [tableView dequeueReusableCellWithIdentifier:testID];
        return cell;
    }else if(indexPath.row % 4 == 2){
        // storyboard中不用注册cell，使用cell标识
        LZStoryboardCell *cell = [tableView dequeueReusableCellWithIdentifier:storyboardID];
        cell.tg = self.tgs[indexPath.row];
        return cell;
    }else{
        return [tableView dequeueReusableCellWithIdentifier:@"test11"];
    }
    
//    return cell;
}


@end
