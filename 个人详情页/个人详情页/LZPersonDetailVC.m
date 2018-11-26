//
//  LZPersonDetailVC.m
//  个人详情页
//
//  Created by 汪大强 on 2018/11/15.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZPersonDetailVC.h"
#import "UIImage+LZImage.h"

#define oriOffY -244
#define oriHeight 200

@interface LZPersonDetailVC ()<UITableViewDelegate, UITableViewDataSource>
/** tableview对象 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstr;

/** 到航条自定义文本 */
@property(nonatomic, strong) UILabel *titleLabel;

@end

static NSString *ID = @"cell";
@implementation LZPersonDetailVC

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"个人详情个人详情个人详情个人详情个人详情个人详情个人详情个人详情个人详情";
        [_titleLabel sizeToFit];
        _titleLabel.textColor = [UIColor colorWithWhite:0 alpha:0];
    }
    return _titleLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    // 1. 凡是在导航条下面的scrollview，默认会设置偏移量.UIEdgeInsetsMake(64, 0, 0, 0)
    //    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    // 不要自动设置偏移量
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    // 让导航条隐藏
    //    self.navigationController.navigationBar.hidden = true;
    // 导航条或者是导航条上的控件设置透明度是没有效果的
    //    self.navigationController.navigationBar.alpha = 0;
    // 设置导航条背景(必须要使用默认的模式UIBarMetricsDefault)
    // 当背景图片设置为nil，系统会自动生成一张半透明的图片，设置为导航条的背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
    
    // 设置标题
    self.navigationItem.titleView = self.titleLabel;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:0 target:self action:@selector(rightBarButtonClick)];
    
}

-(void)rightBarButtonClick{
    NSLog(@"%s", __func__);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 求偏移量
    // 当前点 - 最原始点
    NSLog(@"%f", scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - oriOffY;
    NSLog(@"%f ============ ", offset);
    
    CGFloat h = oriHeight - offset;
    
    if (h < 64) {
        h = 64;
    }
    
    self.heightConstr.constant = h;
    
    // 修改导航条背景图片
    // 根据透明度来生成图片
    // 找最大值
    CGFloat alpha = offset / 136.0;
    NSLog(@"apha === %f", alpha);
    if (alpha >= 1) {
        alpha = 0.99;
    }
    
    // 设置导航条标题的文本颜色
//    UILabel *title = (UILabel *)self.navigationItem.titleView;
    self.titleLabel.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    // 把颜色生成图片
    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
    // 把颜色生成图片
    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
    // 修改导航的背景图片
    [self.navigationController.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 调用cell之前，必须先注册一个cell的nib或class
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
