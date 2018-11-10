//
//  LZTestCell.m
//  静态cell
//
//  Created by 汪大强 on 2018/10/21.
//  Copyright © 2018 LZ. All rights reserved.
//

#import "LZTestCell.h"

@interface LZTestCell ()

@property(nonatomic, weak)IBOutlet UISwitch *sw;


@end

@implementation LZTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.sw.on = false;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)sw:(UISwitch *)sender {
}
@end
