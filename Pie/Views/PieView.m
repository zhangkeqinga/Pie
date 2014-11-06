//
//  PieView.m
//  MDBClient
//
//  Created by yto on 14-8-18.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (id)initWithFrame:(CGRect)frame withColors:(NSArray *)cArray withDatas:(NSArray *)dArray
{
    NSLog(@"%s",__FUNCTION__);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        dataArray = [[NSMutableArray alloc] init];
        colorArray = cArray;
        
        [self addArray:dArray];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s",__FUNCTION__);
    context = UIGraphicsGetCurrentContext();
    CGFloat aW = self.frame.size.width;
    CGFloat aH = self.frame.size.height;
    
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    CGFloat startAngle = -90 * M_PI / 180;
    CGFloat endAngle = 0.0;
    CGFloat allMoney = [self getAllMoney];
    CGFloat centerX = aW/2;         // 圆心x坐标
    CGFloat centerY = aH/2;         // 圆心y坐标
    CGFloat radius = (aH-2)/2;      // 半径
    for (int i = 0; i < [dataArray count]; i++) {
        NSString *perce = [dataArray objectAtIndex:i];
        CGFloat punMoney = fabs([perce floatValue]);
        endAngle = startAngle+punMoney/allMoney*2*M_PI;
        UIColor *aColor = i<[colorArray count]?[colorArray objectAtIndex:i]:COLOR(54.0, 94.0, 150.0, 1.0);
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        //以10为半径围绕圆心画指定角度扇形
        CGContextMoveToPoint(context, centerX, centerY);
        CGContextAddArc(context, centerX, centerY, radius,  startAngle, endAngle, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
        
        // 绘制百分数
        CGRect textRect = [self getAreaForStartAngle:startAngle endAngle:endAngle radius:radius centerPoint:CGPointMake(centerX, centerY)];
        //设置画笔线条粗细
        CGContextSetLineWidth(context, 1.0);
        //设置矩形填充颜色：红色
        CGContextSetRGBFillColor (context, 1.0, 1.0, 1.0, 1.0);
        //设置字体
        UIFont *font = [UIFont systemFontOfSize:10.0];
        //在指定的矩形区域内画文字
        NSString *text = [NSString stringWithFormat:@"%.0f%%",punMoney/allMoney*100];
        CGSize size = GAB_MULTILINE_TEXTSIZE(text, font, textRect.size, NSLineBreakByWordWrapping);
        CGFloat x = textRect.origin.x+(textRect.size.width-size.width)/2;
        CGFloat y = textRect.origin.y+(textRect.size.height-size.height)/2;
        
        GAB_DRAW_IN_RECT(text, font, CGRectMake(x, y, size.width, size.height));
        
        startAngle = endAngle;
    }
}

/**
 * 获取扇形中文本的区域
 * @param sAngle 扇形的开始弧度
 * @param eAngle 扇形的结束弧度
 * @param r 扇形的半径
 * @param cPoint 扇形的中心点（圆点）
 **/
- (CGRect)getAreaForStartAngle:(CGFloat)sAngle endAngle:(CGFloat)eAngle radius:(CGFloat)r centerPoint:(CGPoint)cPoint {
    
    CGFloat cAngle = (sAngle+eAngle)/2;
    CGPoint midPoint = CGPointMake(cos(cAngle)*r+cPoint.x, sin(cAngle)*r+cPoint.y);  // 扇形边的中心点
    CGPoint halfPoint = CGPointMake((midPoint.x+cPoint.x)/2, (midPoint.y+cPoint.y)/2); // 二分之一点
    CGPoint fourPoint = CGPointMake((midPoint.x+halfPoint.x)/2, (midPoint.y+halfPoint.y)/2); // 四分之一点
    return CGRectMake(fourPoint.x-20, fourPoint.y-10, 40, 20);
}

- (CGFloat)getAllMoney {
    CGFloat allM = 0;
    for (NSString *perce in dataArray) {
        allM += fabs([perce floatValue]);
    }
    return allM;
}

/**
 * 添加数组
 **/

- (void)addArray:(NSArray *)aArray {
    for (id aModel in aArray) {
        [dataArray addObject:aModel];
    }
    [self setNeedsDisplay];
}

/**
 * 清空数组
 **/
- (void)deleteArray {
    [dataArray removeAllObjects];
}

@end
