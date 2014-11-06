//
//  PieView.h
//  MDBClient
//
//  Created by yto on 14-8-18.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView {
    CGContextRef context;
    
    NSMutableArray *dataArray;
    NSArray *colorArray;
}

- (id)initWithFrame:(CGRect)frame withColors:(NSArray *)cArray withDatas:(NSArray *)dArray;

/**
 * 添加数组
 **/
- (void)addArray:(NSArray *)aArray;

/**
 * 清空数组
 **/
- (void)deleteArray;
@end
