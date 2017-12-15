//
//  ViewController.m
//  点击图标放大
//
//  Created by WangXueqi on 2017/12/12.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIButton * button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.button];
}

//点击图标放大
- (UIButton *)button {
    
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 0, 60, 60)];
        [_button setCenter:self.view.center];
        [_button setImage:[UIImage imageNamed:@"list_check"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)buttonClick {
    
    /*
     参数1:动画持续时间
     参数2:多久后开始动画
     参数3:动画类型
     */
    [UIView animateKeyframesWithDuration:0.8 delay:0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        /*
         参数1:关键帧开始时间
         参数2:关键帧占用时间比例
         参数3:到达该关键帧时的属性值
         */
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/2.0 animations:^{
            self.button.transform = CGAffineTransformMakeScale(1.6, 1.6);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/2.0 relativeDuration:1/2.0 animations:^{
            self.button.transform = CGAffineTransformIdentity;
        }];
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
