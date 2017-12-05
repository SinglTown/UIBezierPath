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
#import <YYWeakProxy.h>
#import "AnyeRead.h"
@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic,strong)AnyeReadPopView *pop;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popViewTapGRAction:)];
    [self.view addGestureRecognizer:tapGR];
    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
//    imageView.image = [AnyeRead start];
//    imageView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:imageView];
    
    UIBezierPathView *bezierView = [[UIBezierPathView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    bezierView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bezierView];
    
    
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
    
//    //设置圆角(带有弧度)
//    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200 , 200)];
//    view.contentMode = UIViewContentModeScaleAspectFill;
//    view.image = [UIImage imageNamed:@"dropdown_bg"];
//    view.layer.mask = [CAShapeLayer getImageCornerMaskWithFrame:view.bounds withCornerWdith:10];
//
//
//    view.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:view];
    
    
    //画线
    /**
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor purpleColor].CGColor;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.lineWidth = 4;
    layer.frame = lineView.bounds;
//    layer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath;
//    layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)].CGPath;
    layer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES].CGPath;//跟正常的坐标系不太一样
    //YES代表顺时针,NO代表逆时针,startAngle起始角度,endAngle结束角度
    //此处的角度都是以圆的最右边为起始,0度
    //顺时针和逆时针的计算角度是不同的
    [lineView.layer addSublayer:layer];
    [self.view addSubview:lineView];
    
//    [lineView.layer addAnimation:<#(nonnull CAAnimation *)#> forKey:<#(nullable NSString *)#>]
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.removedOnCompletion = NO;
    animation.duration = 2;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = 3;
    animation.toValue =@1;//此处的值表示,动画走整个路径的多少(百分比)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [layer addAnimation:animation forKey:@"animate"];
    });
//    animation.delegate = self;
//    animation.delegate = [YYWeakProxy proxyWithTarget:self];
    **/
    
    
    
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
