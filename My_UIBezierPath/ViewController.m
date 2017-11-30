//
//  ViewController.m
//  My_UIBezierPath
//
//  Created by 赵传保 on 2017/11/28.
//  Copyright © 2017年 赵传保. All rights reserved.
//

#import "ViewController.h"
#import "UIBezierPathView.h"
#import "AnyeReadPopView.h"
#import "CAShapeLayer+Mask.h"
#import "CAShapeLayer+CornerLayer.h"
#import "AnyeReadPopView.h"
@interface ViewController ()

@property (nonatomic,strong)AnyeReadPopView *pop;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popViewTapGRAction:)];
    [self.view addGestureRecognizer:tapGR];
    
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(100, 100)];
//    [path addLineToPoint:CGPointMake(200, 200)];
//    [path addLineToPoint:CGPointMake(50, 200)];
//    [path closePath];
//    path.lineWidth = 2;
//    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = path.bounds;
//    layer.lineCap       = kCALineCapSquare; 
//    layer.fillColor = [UIColor yellowColor].CGColor;
//    layer.path = CFBridgingRetain(path);
//    layer.lineWidth     = 4.0f;                          //线条宽度
//    layer.strokeStart   = 0.0f;
//    layer.strokeEnd     = 0.1f;
//    [bezierPath.layer addSublayer:layer];
    
    
    
    //配合CAShapeLayer使用UIBezierPath
    //画消息框
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 150)];
//    view.layer.mask = [CAShapeLayer getMastWithFrame:view.bounds];
//    view.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:view];

//    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100 , 100)];
//    view.contentMode = UIViewContentModeScaleAspectFill;
//    view.image = [UIImage imageNamed:@"dropdown_bg"];
//    //画圆角(圆形)
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = path.CGPath;
//
//    view.layer.mask = layer;
    
    //设置圆角(带有弧度)
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200 , 200)];
    view.contentMode = UIViewContentModeScaleAspectFill;
    view.image = [UIImage imageNamed:@"dropdown_bg"];
    view.layer.mask = [CAShapeLayer getImageCornerMaskWithFrame:view.bounds withCornerWdith:10];
    
    
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    
    
    
    
}
-(void)popViewTapGRAction:(UITapGestureRecognizer *)sender
{
    //隐藏popview
    [self.pop popViewHidden];;//先把之前的拿掉
    self.pop = [[AnyeReadPopView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.pop showMenuWithPoint:[sender locationInView:self.view] withTitleArray:@[@"复制",@"画线"]];
    [self.view addSubview:self.pop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
