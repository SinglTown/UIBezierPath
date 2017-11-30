//
//  AnyeReadPopView.m
//  anye
//
//  Created by 赵传保 on 2017/11/28.
//  Copyright © 2017年 暗夜. All rights reserved.
//

#import "AnyeReadPopView.h"


#pragma mark - 大的背景用来显示popview
@interface AnyeReadPopView()

@property (nonatomic,assign)CGPoint point;

@property (nonatomic,strong)AnyeReadPopSmallView *popView;

@end


@implementation AnyeReadPopView

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
    [self addSubview:self.popView];
}
-(void)showMenuWithPoint:(CGPoint)point withTitleArray:(NSArray *)titleArray
{
    self.point = point;
    
    [self removeFromSuperview];
    NSInteger itemNum = titleArray.count;
    CGFloat popViewWidth = ReadPopViewItemWidth*itemNum;
    [self.popView showDetailMenuWithPoint:CGPointMake(popViewWidth/2, ReadPopViewTotalHeight) withTitleArray:titleArray];//相对坐标不同,需改一下
    self.popView.frame = CGRectMake(self.point.x-ReadPopViewItemWidth*itemNum/2, self.point.y - ReadPopViewTotalHeight, ReadPopViewItemWidth*itemNum, ReadPopViewTotalHeight);
    self.popView.alpha = 0;
    self.popView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [UIView animateWithDuration:0.3 animations:^{
        self.popView.alpha = 1;
        self.popView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}
-(AnyeReadPopSmallView *)popView
{
    if (!_popView) {
        _popView = [[AnyeReadPopSmallView alloc] init];
        _popView.backgroundColor = [UIColor clearColor];
    }
    return _popView;
}
//消失
-(void)popViewHidden
{
    self.popView.alpha = 1;
    [UIView animateWithDuration:0.3 animations:^{
        self.popView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end


#pragma mark - 弹出的小的视图
@interface AnyeReadPopSmallView()

@property (nonatomic,assign)CGPoint point;

@property (nonatomic,strong)NSMutableArray *titleBtnArray;
@property (nonatomic,strong)NSMutableArray *lineArray;

@end

@implementation AnyeReadPopSmallView

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
    self.titleBtnArray = [[NSMutableArray alloc] init];
    self.lineArray = [[NSMutableArray alloc] init];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat heightSpace = 10;
    CGFloat itemWidth = self.frame.size.width/self.titleBtnArray.count;
    CGFloat itemHeight = self.frame.size.height-ReadPopSanJiaoWidth;
    for (int i = 0; i < self.titleBtnArray.count; i++) {
        UIButton *btn = self.titleBtnArray[i];
        btn.frame = CGRectMake(itemWidth*i, 0, itemWidth, itemHeight);
        UIView *line = self.lineArray[i];
        line.frame = CGRectMake(btn.frame.origin.x+btn.frame.size.width, heightSpace, 1, btn.frame.size.height-heightSpace*2);
    }
    
}
-(void)showDetailMenuWithPoint:(CGPoint)point withTitleArray:(NSArray *)titleArray
{
    self.point = point;
    
    
    //创建按钮
    CGFloat heightSpace = 10;
    CGFloat itemWidth = 0;
    CGFloat itemHeight = 0;
    for (int i = 0 ; i < titleArray.count; i ++ ) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, itemWidth, itemHeight);
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [self addSubview:btn];
        [self.titleBtnArray addObject:btn];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(btn.frame.origin.x+btn.frame.size.width, heightSpace, 1, btn.frame.size.height-heightSpace*2);
        line.backgroundColor = [UIColor whiteColor];
        [self.lineArray addObject:line];
        if (i != titleArray.count-1) {
            [self addSubview:line];
        }
    }
    
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] set];

    CGPoint point = self.point;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    //小三角底边一半的宽度
    CGFloat bottomSepWidth = ReadPopSanJiaoWidth;
    //小三角垂直的高度
    CGFloat bottomHeight = ReadPopSanJiaoWidth;
    //余留的小角
    CGFloat corderWidth = 10;
    
    //这种没有圆角
//    [path addLineToPoint:CGPointMake(point.x-bottomSepWidth, point.y-bottomHeight)];
//    [path addLineToPoint:CGPointMake(point.x-self.width/2, point.y-bottomHeight)];
//    [path addLineToPoint:CGPointMake(point.x-self.width/2, point.y-bottomHeight-ReadPopViewContentHeight)];
//    [path addLineToPoint:CGPointMake(point.x+self.width/2, point.y-bottomHeight-ReadPopViewContentHeight)];
//    [path addLineToPoint:CGPointMake(point.x+self.width/2, point.y-bottomHeight)];
//    [path addLineToPoint:CGPointMake(point.x+bottomSepWidth, point.y-bottomHeight)];
    
    //有圆角
    CGFloat width  = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    [path addLineToPoint:CGPointMake(point.x-bottomSepWidth, point.y-bottomHeight)];
    [path addLineToPoint:CGPointMake(point.x-width/2+corderWidth, point.y-bottomHeight)];
    [path addQuadCurveToPoint:CGPointMake(point.x-width/2, point.y-bottomHeight-corderWidth) controlPoint:CGPointMake(point.x-width/2, point.y-bottomHeight)];
    [path addLineToPoint:CGPointMake(point.x-width/2, point.y-bottomHeight-ReadPopViewContentHeight+corderWidth)];
    [path addQuadCurveToPoint:CGPointMake(point.x-width/2+corderWidth, point.y-bottomHeight-ReadPopViewContentHeight) controlPoint:CGPointMake(point.x-width/2, point.y-bottomHeight-ReadPopViewContentHeight)];
    [path addLineToPoint:CGPointMake(point.x+width/2-corderWidth, point.y-bottomHeight-ReadPopViewContentHeight)];
    [path addQuadCurveToPoint:CGPointMake(point.x+width/2, point.y-bottomHeight-ReadPopViewContentHeight+corderWidth) controlPoint:CGPointMake(point.x+width/2, point.y-bottomHeight-ReadPopViewContentHeight)];
    [path addLineToPoint:CGPointMake(point.x+width/2, point.y-bottomHeight-corderWidth)];
    [path addQuadCurveToPoint:CGPointMake(point.x+width/2-corderWidth, point.y-bottomHeight) controlPoint:CGPointMake(point.x+width/2, point.y-bottomHeight)];
    [path addLineToPoint:CGPointMake(point.x+bottomSepWidth, point.y-bottomHeight)];
    
    [path closePath];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    NSLog(@"%@",@(point));
    NSLog(@"%f",width);
    
    [[UIColor blackColor] setFill];
    [path stroke];
    
    [path fill];
}

@end
