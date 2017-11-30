//
//  AnyeReadPopView.h
//  anye
//
//  Created by 赵传保 on 2017/11/28.
//  Copyright © 2017年 暗夜. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ReadPopViewTotalHeight 45

#define ReadPopViewItemWidth 50

//小三角的顶边宽
#define ReadPopSanJiaoWidth (ReadPopViewTotalHeight/4)

#define ReadPopViewContentHeight (ReadPopViewTotalHeight-ReadPopSanJiaoWidth)

@class AnyeReadPopSmallView;
@interface AnyeReadPopView : UIView


-(void)showMenuWithPoint:(CGPoint)point withTitleArray:(NSArray *)titleArray;

//消失
-(void)popViewHidden;
@end


@interface AnyeReadPopSmallView :UIView


-(void)showDetailMenuWithPoint:(CGPoint)point withTitleArray:(NSArray *)titleArray;

@end
