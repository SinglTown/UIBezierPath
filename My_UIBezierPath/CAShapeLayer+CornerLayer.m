//
//  CAShapeLayer+CornerLayer.m
//  My_UIBezierPath
//
//  Created by 赵传保 on 2017/11/30.
//  Copyright © 2017年 赵传保. All rights reserved.
//

#import "CAShapeLayer+CornerLayer.h"

@implementation CAShapeLayer (CornerLayer)
//绘制圆角的CAShapeLayer
+(instancetype)getImageCornerMaskWithFrame:(CGRect)frame withCornerWdith:(CGFloat)corner
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}
@end
