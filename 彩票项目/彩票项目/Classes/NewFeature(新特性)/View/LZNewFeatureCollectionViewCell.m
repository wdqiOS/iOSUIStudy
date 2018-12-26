//
//  LZNewFeatureCollectionViewCell.m
//  彩票项目
//
//  Created by 汪大强 on 2018/11/26.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZNewFeatureCollectionViewCell.h"
#import "LZTabBarController.h"

@interface LZNewFeatureCollectionViewCell ()

/** 背景图片 */
@property(nonatomic, weak) UIImageView *bgImageView;

/** 立即体验按钮 */
@property(nonatomic, weak) UIButton *startBtn;

@end

@implementation LZNewFeatureCollectionViewCell

// 懒加载立即体验按钮
-(UIButton *)startBtn{
    if(_startBtn == nil){
        UIButton *startBtn = [[UIButton alloc] init];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [startBtn sizeToFit];
        
        startBtn.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        [self.contentView addSubview:startBtn];
        _startBtn = startBtn;
        
        [startBtn addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

// 立即体验按钮点击事件
-(void)buttonOnClick:(UIButton *)sender{
   // 切换主界面
    // 切换界面的方式 1.nav -> push 2. tabbar -> tabBarVC 3. modale
    // 想让新特性界面销毁
    
    // 切换窗口的根控制器
    LZKeyWindow.rootViewController = [[LZTabBarController alloc] init];
    
}

// 懒加载背景图片
-(UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        self.bgImageView = imageView;
    }
    return _bgImageView;
}

// 重写bgImage
-(void)setBgImage:(UIImage *)bgImage{
    _bgImage = bgImage;
    self.bgImageView.image = bgImage;
}

-(void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pageCount{
        if (indexPath.item == pageCount - 1) {
            // 最后一个cell
            // 当是最后一个cell添加立即体验按钮
            self.startBtn.hidden = false;
        }else{
            // 不是最后一个cell
            // 隐藏立即体验按钮
            self.startBtn.hidden = true;
        }
}

@end
