//
//  UIBezierPathView.m
//  My_UIBezierPath
//
//  Created by 赵传保 on 2017/11/28.
//  Copyright © 2017年 赵传保. All rights reserved.
//

#import "UIBezierPathView.h"

@implementation UIBezierPathView

-(void)drawRect:(CGRect)rect
{
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
}

@end
