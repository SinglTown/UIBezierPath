//
//  UIBezierPathView.m
//  My_UIBezierPath
//
//  Created by 赵传保 on 2017/11/28.
//  Copyright © 2017年 赵传保. All rights reserved.
//

#import "UIBezierPathView.h"

@implementation UIBezierPathView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}
-(void)allViews
{
    
}

-(void)drawRect:(CGRect)rect
{
    //绘制三角形
    /**
    [[UIColor blackColor] set];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(50, 200)];
    [path closePath];
    path.lineWidth = 2;
    [path stroke];
    
    [[UIColor blackColor] setFill];
    [path fill];
     **/
    
    //绘制虚线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 0, 50);
    CGContextAddLineToPoint(context, self.frame.size.width, 50);
    CGFloat arr[] = {30,10};//第一个参数标示虚线线条的宽度,第二个参数代表虚线空隙的宽度
    CGContextSetLineDash(context, 0, arr, 2);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
