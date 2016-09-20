//
//  LMLAniTabBackView.m
//  LMLAniTabChooser
//
//  Created by 优谱德 on 16/6/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "LMLAniTabBackView.h"
#import "LMLAniTabCell.h"
//#import "AnimationUtil.h"

#define Traigle_W 14
#define Traigle_H 10

@interface LMLAniTabBackView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *backViewOfTabAndTran;  // 三角形和tabView的back

@property (nonatomic, assign) CGRect tabFrame;  // tab的frame

@property (nonatomic, strong) UIView * inView;

@property (nonatomic, strong) UIView *rectBack; // 圆角矩形背景

@property (nonatomic, assign) CGPoint backViewOfTabAndTranCenter;  // 保存的放到到的中点




@end

@implementation LMLAniTabBackView

- (instancetype)initWithFrame:(CGRect)frame andTabFrame:(CGRect)tabFrame andImgs:(NSArray *)imgs andTitles:(NSArray *)titles showWithView:(UIView *)inView{
    
    self.tabFrame = tabFrame;
    self.inView = inView;
    self.imgArr = imgs;
    self.titlesArr = titles;
    self.durationTime = 0.2; // 默认
    
    return [self initWithFrame:frame];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//
//
//
//
//}

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        [self.inView addSubview:self];
        //[AnimationUtil positionAni:CGPointMake(kScreen_Width - self.frame.size.width - 10, (64 + self.frame.size.height)/2) andBounds:CGRectMake(0, 0, 200, 200) WithView:self];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.status = 2;
        
        [self initUI];
    }
    return self;
}

#pragma mark - INIT

- (void)initUI {
    
    /*UIView *back_alpha = [[UIView alloc] initWithFrame:rect];
     back_alpha.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
     UITapGestureRecognizer *tap_back = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapBackView:)];
     [back_alpha addGestureRecognizer:tap_back];
     [self addSubview:back_alpha];*/
    
    /* 1.画三角形 */
    // 设置背景颜色
    //UIColor *back_color = [UIColor colorWithWhite:0.0 alpha:0.2];
    //    [[UIColor whiteColor] set];
    //
    //    UIRectFill([self bounds]);
    //
    //    // 上下文
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    // 利用path进行绘制三角形
    //    CGContextBeginPath(context);  // 标记
    //    CGContextMoveToPoint(context,rect.size.width - 2 * Traigle_W, Traigle_H );  // 起点 // _tabFrame.size.width - Traigle_W * 2, Traigle_H
    //    CGContextAddLineToPoint(context,rect.size.width - Traigle_W, Traigle_H); // _tabFrame.size.width - Traigle_W, Traigle_H
    //    CGContextAddLineToPoint(context, rect.size.width - Traigle_W *3/2,0); // _tabFrame.size.width - Traigle_W *3/2, 0
    //    _sharpPoint = CGPointMake(_tabFrame.size.width - Traigle_W *3/2, 0);
    //    CGContextClosePath(context);  // 结束路劲
    //
    //    [[UIColor whiteColor] setFill];  // 设置填充色
    //
    //    [[UIColor whiteColor] setStroke];
    //
    //    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    
    self.backViewOfTabAndTran = [[UIView alloc] initWithFrame:CGRectMake(_tabFrame.origin.x, _tabFrame.origin.y - Traigle_H, _tabFrame.size.width, _tabFrame.size.height + Traigle_H)];
    self.backViewOfTabAndTranCenter = self.backViewOfTabAndTran.center;
    
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(_tabFrame.size.width - Traigle_W - 3 , 0, Traigle_W, Traigle_H + 1)];
    img.image = [UIImage imageNamed:@"tran3.png"];
    
    img.frame = CGRectMake(_tabFrame.origin.x + _tabFrame.size.width - 3 - Traigle_W, _tabFrame.origin.y - Traigle_H, Traigle_W, Traigle_H);
    self.sharpPoint = CGPointMake(_tabFrame.origin.x + _tabFrame.size.width - Traigle_W/2 -3 , _tabFrame.origin.y);
    self.fromPoint = self.sharpPoint;
    
    [_backViewOfTabAndTran addSubview:img];
    img.frame = CGRectMake(_tabFrame.size.width - Traigle_W - 3 , 0, Traigle_W, Traigle_H + 1);
    
    /* 2.圆角矩形背景 */
    /*_rectBack = [[UIView alloc] initWithFrame:CGRectMake(_tabFrame.origin.x, Traigle_H, _tabFrame.size.width, _tabFrame.size.height - Traigle_H)];
    
    CGPoint point_origin = CGPointMake(_tabFrame.origin.x, Traigle_H);
    CGPoint point_after = [_inView convertPoint:point_origin toView:_backViewOfTabAndTran];
    
    _rectBack.layer.cornerRadius = 4;
    _rectBack.layer.masksToBounds = YES;
    _rectBack.backgroundColor = [UIColor whiteColor];
    _rectBack.origin = CGPointMake(point_after.x, point_after.y + Traigle_H);
    //_rectBack.frame = CGRectMake(_backViewOfTabAndTran.origin.x, _backViewOfTabAndTran.origin.y + Traigle_H, _backViewOfTabAndTran.size.width, _backViewOfTabAndTran.size.width - Traigle_H);
    
    
    [_backViewOfTabAndTran addSubview:_rectBack];
    
    _rectBack.center = _backViewOfTabAndTran.center;*/
    
    /* 不透明度的背景 */
    _opacity_view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _opacity_view.backgroundColor = [UIColor blackColor];
    _opacity_view.alpha = 0.2;
    
    UITapGestureRecognizer *tap_opacity = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapBackView:)];
    [_opacity_view addGestureRecognizer:tap_opacity];
    
    [self addSubview:_opacity_view];
    /* 3.添加tableView到圆角矩形上 */
    [self addTab];
    
    [self addSubview:_backViewOfTabAndTran];
    
    /* 初始化的时候为不透明 */
    self.backViewOfTabAndTran.transform = CGAffineTransformMakeScale(0.01, 0.01);
    self.backViewOfTabAndTran.alpha = 0.0;
    self.backViewOfTabAndTran.center = self.sharpPoint;
    self.opacity_view.alpha = 0.0;
    
}



#pragma mark - tableview delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.imgArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *celle_id = @"cell_id";
    
    LMLAniTabCell *cell = [tableView dequeueReusableCellWithIdentifier:celle_id];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"LMLAniTabCell" owner:self options:nil].firstObject;
    }
    [cell setDataWithImg:self.imgArr[indexPath.row] andTitle:self.titlesArr[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.ani_block((int)indexPath.row);
}

#pragma mark - view display

-(void)viewDidLayoutSubviews {
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

#pragma mark - private methods

- (void)addTab {
    
    _tableView = [[UITableView alloc] initWithFrame:_tabFrame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.layer.cornerRadius = 4;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.layer.masksToBounds = YES;
    //_tableView.center = _backViewOfTabAndTranCenter;
    _tableView.frame = CGRectMake(0 , Traigle_H, _tabFrame.size.width, _tabFrame.size.height -  Traigle_H);
    [_backViewOfTabAndTran addSubview:_tableView];
    
    
    
}

#pragma mark - gesture

- (void)respondsToTapBackView:(UITapGestureRecognizer *)tap {
    
    if (self && self.status == 2) {
        
        [self dismiss];
    }
}

#pragma mark - show and dismiss

- (void)show {
    
    
    if (!self) {
        //[AnimationUtil positionAni:CGPointMake(kScreen_Width - self.frame.size.width - 10, (64 + self.frame.size.height)/2) andBounds:CGRectMake(0, 0, 200, 200) WithView:self];
        [_inView addSubview:self];
        [_inView bringSubviewToFront:self];
        
        [UIView animateWithDuration:self.durationTime animations:^{
            //放大到指定的位置
            self.backViewOfTabAndTran.transform = CGAffineTransformMakeScale(1, 1);
            self.backViewOfTabAndTran.alpha = 1.0;
            self.backViewOfTabAndTran.center = CGPointMake(_tabFrame.origin.x + _tabFrame.size.width / 2, _tabFrame.origin.y + _tabFrame.size.height / 2);
            
            self.opacity_view.alpha = 0.2;
            
        }completion:^(BOOL finished) {
            //[self removeFromSuperview];
        }];
        
        
        self.status = 2; // 1.隐藏 2.显示
        
        return;
    }else {
        
        self.alpha = 1.0;
        [_inView addSubview:self];
        
        [UIView animateWithDuration:self.durationTime animations:^{
            //self.transform = CGAffineTransformMakeScale(1, 1);
            //放大到指定的位置
            self.backViewOfTabAndTran.transform = CGAffineTransformMakeScale(1, 1);
            self.backViewOfTabAndTran.alpha = 1.0;
            self.backViewOfTabAndTran.center = self.backViewOfTabAndTranCenter;//CGPointMake(_tabFrame.origin.x + _tabFrame.size.width / 2, _tabFrame.origin.y + _tabFrame.size.height / 2);
            
            self.opacity_view.alpha = 0.2;
            
        }completion:^(BOOL finished) {
            //[self removeFromSuperview];
        }];
        
        self.status = 2; // 1.隐藏 2.显示
    }
    
}

- (void)dismiss {
    
    
    //__weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:_durationTime animations:^{
        self.backViewOfTabAndTran.transform = CGAffineTransformMakeScale(0.01, 0.01);
        //缩小到指定的位置
        self.backViewOfTabAndTran.center = self.sharpPoint;
        self.backViewOfTabAndTran.alpha = 0.f;
        self.opacity_view.alpha = 0.0;
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        //self = nil;  // if I set this line to let self Retain Count = 0, there will show the error:Cannot assign to 'self' outside of a method in the init family. How can I rationalize my memory (manage my memory)?
    }];
    
    self.status = 1; // 1.隐藏 2.显示
}


@end
