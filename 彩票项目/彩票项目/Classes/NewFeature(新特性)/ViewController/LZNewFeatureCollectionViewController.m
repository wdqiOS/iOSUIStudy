//
//  LZNewFeatureCollectionViewController.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZNewFeatureCollectionViewController.h"
#import "LZNewFeatureCollectionViewCell.h"

@interface LZNewFeatureCollectionViewController ()

/** 记录上一次偏移量 */
@property(nonatomic, assign) CGFloat lastOffsetX;

/** 球图片 */
@property(nonatomic, weak) UIImageView *guide;

/** 大标题 */
@property(nonatomic, weak) UIImageView *guideLargeText;

/** 小标题 */
@property(nonatomic, weak) UIImageView *guideSmallText;

@end

@implementation LZNewFeatureCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 修改item的大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
//    // 修改行间距
    flowLayout.minimumLineSpacing = 0;
//    // 修改每一个item的间距
    flowLayout.minimumInteritemSpacing = 0;
    // 修改滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 修改每一组的边距
//    flowLayout.sectionInset = UIEdgeInsetsMake(100, 20, 30, 40);
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 注册cell
    [self.collectionView registerClass:[LZNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // self.collectionView != self.view
    // self.collectionView 添加到self.view上
    // 设置分页
    self.collectionView.pagingEnabled = true;
    // 禁止弹簧效果
    self.collectionView.bounces = false;
    // 隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = false;
    
    // 添加内容
    // 1. 添加图片
    // 2. 添加到哪里 collectionView
    [self setupAddChildImageView];
    
   
}

// 当滑动减速的时候调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 平移一个屏幕宽度
    // 总偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    // 计算一个偏移量
    CGFloat del = offsetX - self.lastOffsetX;
    NSLog(@"del === %f", del);
    
    if (del == 0) {
        return;
    }
    
    // 偏移子控件
    // 计算页码
    NSInteger page = offsetX / fabs(del);
    NSString *picStr = [NSString stringWithFormat:@"guide%zd", page + 1];
    self.guide.image = [UIImage imageNamed:picStr];
    
    NSString *guideLargeTextPicStr = [NSString stringWithFormat:@"guideLargeText%zd", page + 1];
    self.guideLargeText.image = [UIImage imageNamed:guideLargeTextPicStr];
    
    NSString *guideSmallTextPicStr = [NSString stringWithFormat:@"guideSmallText%zd", page + 1];
    self.guideSmallText.image = [UIImage imageNamed:guideSmallTextPicStr];
    
    
    self.guide.x += 2 * del;
    self.guideLargeText.x += 2 * del;
    self.guideSmallText.x += 2 * del;
    [UIView animateWithDuration:0.5 animations:^{
        self.guide.x -= del;
        self.guideLargeText.x -= del;
        self.guideSmallText.x -= del;
    }];
    
    self.lastOffsetX = offsetX;
}

// 添加子控件
-(void)setupAddChildImageView{
    // 1. 添加线
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    CGFloat distance = 150;
    if ([UIScreen mainScreen].bounds.size.width == 320) {
        distance = 270;
    }
    guideLine.x -= distance;
    
    // 2. 添加球
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guide];
    guide.x += 50;
    self.guide = guide;
    // 3. 添加大标题
    UIImageView * guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeText];
    guideLargeText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.7);
    self.guideLargeText = guideLargeText;
    // 4. 添加小标题
    UIImageView * guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.8);
    self.guideSmallText = guideSmallText;
}

#pragma mark --------------------
#pragma mark - collectionview数据源方法
// 多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#define LZPage 4

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return LZPage;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LZNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // cell创建出来就要imageview
    
    // 创建image
    // 拼接图片名字
    NSString *picName = [NSString stringWithFormat:@"guide%zdBackground", indexPath.item + 1];
    UIImage *image = [UIImage imageNamed:picName];
    cell.bgImage = image;
    
    [cell setIndexPath:indexPath count:LZPage];
    

    
    return cell;
}



@end
