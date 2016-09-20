//
//  LMLAniTabBackView.h
//  LMLAniTabChooser
//
//  Created by 优谱德 on 16/6/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LMLAniTabBlock)(int index);  // 0开始

@interface LMLAniTabBackView : UIView

@property (nonatomic, assign) int status;  // 1.隐藏  2.显示
@property (nonatomic, assign) CGPoint sharpPoint;  // 尖点（三角形的顶部）

@property (nonatomic, strong) UIView *opacity_view;  // 不透明度的黑色背景

@property (nonatomic, strong) UITableView *tableView;
/* 必填参数 */  //imgArr 和 titlesArr 数量务必相等
@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic, strong) NSArray *titlesArr;

@property (nonatomic, copy) LMLAniTabBlock ani_block;

@property (nonatomic, assign) CGPoint fromPoint;  // 从哪儿开始(默认是三角形的顶点)

@property (nonatomic, assign) float durationTime;  // 时间

// Frame:一般是self.frame（controller的frame）
- (instancetype)initWithFrame:(CGRect)frame andTabFrame:(CGRect)tabFrame andImgs:(NSArray *)imgs andTitles:(NSArray *)titles showWithView:(UIView *)inView;  // inView：在哪个view上面显示



- (void)show;   // 显示
- (void)dismiss;// 消失



@end
