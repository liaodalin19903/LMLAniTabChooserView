//
//  LMLAniTabCell.m
//  LMLAniTabChooser
//
//  Created by 优谱德 on 16/6/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "LMLAniTabCell.h"

@implementation LMLAniTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataWithImg:(NSString *)img andTitle:(NSString *)titles {

    self.head_img.image = [UIImage imageNamed:img];
    self.titles.text = titles;
}

@end
