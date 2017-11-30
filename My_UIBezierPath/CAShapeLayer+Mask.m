//
//  CAShapeLayer+Mask.m
//  My_UIBezierPath
//
//  Created by 赵传保 on 2017/11/30.
//  Copyright © 2017年 赵传保. All rights reserved.
//

#import "CAShapeLayer+Mask.h"

@implementation CAShapeLayer (Mask)


+(instancetype)getMastWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    CGFloat leftSpace = 15;
    CGFloat corderTopSpace = 20;
    CGFloat gapSpace = 15;
    
    CGPoint point1 = CGPointMake(0, corderTopSpace);
    CGPoint point2 = CGPointMake(leftSpace, corderTopSpace);
    CGPoint point3 = CGPointMake(leftSpace, 0);
    CGPoint point4 = CGPointMake(width, 0);
    CGPoint point5 = CGPointMake(width, height);
    CGPoint point6 = CGPointMake(leftSpace, height);
    CGPoint point7 = CGPointMake(leftSpace, gapSpace+corderTopSpace);
    
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:point1];
    [bezier addLineToPoint:point2];
    [bezier addLineToPoint:point3];
    [bezier addLineToPoint:point4];
    [bezier addLineToPoint:point5];
    [bezier addLineToPoint:point6];
    [bezier addLineToPoint:point7];
    [bezier closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bezier.CGPath;
    return layer;
}


@end
