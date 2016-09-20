//
//  LMLAniTabCell.h
//  LMLAniTabChooser
//
//  Created by 优谱德 on 16/6/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMLAniTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head_img;
@property (weak, nonatomic) IBOutlet UILabel *titles;

- (void)setDataWithImg:(NSString *)img andTitle:(NSString *)titles;

@end
