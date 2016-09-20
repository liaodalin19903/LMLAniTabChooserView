//
//  ViewController.m
//  LMLAniTabChooserViewDemo
//
//  Created by 优谱德 on 16/9/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "LMLAniTabBackView.h"

//设备屏幕尺寸
#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()
{
    
    LMLAniTabBackView *lml_v;  // 这个是选择器
    NSArray *imgsArr; // 选择器的图片数组
    NSArray *chTitlesArr; // 选择器的标题数组
}

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)initData {
    
    /* 初始化选择器的数据 */
    imgsArr = @[@"bk_fangkuang.png",@"bk_lanzi.png", @"bk_xiaozhu.png", @"bk_xiaoyu.png", @"bk_xiaomiao.png", @"bk_cengdie.png", @"bk_xiaoche.png",  @"bk_jiahao.png"];
    chTitlesArr = @[@"全部类型", @"种植技术",  @"畜牧养殖", @"水产养殖", @"林业苗木",@"水利工程", @"农业机械", @"其他类型"];
}

- (IBAction)choose:(UIButton *)sender {
    
    
    
    lml_v = [[LMLAniTabBackView alloc] initWithFrame:self.view.frame andTabFrame:CGRectMake(kScreen_Width - 125 - 10, 74, 125, 362) andImgs:imgsArr andTitles:chTitlesArr showWithView:self.view];
    lml_v.durationTime = 0.15;
    
    __weak __typeof(self) weakSelf = self;
    __weak LMLAniTabBackView *lml_v_weak = lml_v;
    lml_v.ani_block = ^(int index){
        
        switch (index) {
                
            case 0:
            {
                weakSelf.typeLabel.text = @"全部类型";
               
            }
                break;
            case 1:
            {
                weakSelf.typeLabel.text = @"种植技术";
                
            }
                break;
            case 2:
            {
                weakSelf.typeLabel.text = @"畜牧养殖";
               
            }
                break;
            case 3:
            {
                weakSelf.typeLabel.text = @"水产养殖";
               
            }
                break;
            case 4:
            {
                weakSelf.typeLabel.text = @"林业苗木";
               
            }
                break;
            case 5:
            {
                weakSelf.typeLabel.text = @"水利工程";
               
            }
                break;
            case 6:
            {
                weakSelf.typeLabel.text = @"农业机械";
               
            }
                break;
            case 7:
            {
                weakSelf.typeLabel.text = @"其他类型";
              
            }
                break;
                
            default:
                break;
        }
        [lml_v_weak dismiss];
    };
    [lml_v show];

}

@end
