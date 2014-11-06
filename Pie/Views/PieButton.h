//
//  PieButton.h
//  MDBClient
//
//  Created by yto on 14-8-19.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PB_W 70.0
#define PB_H 20.0
#define PB_Margin_LR 5
#define PB_View_WH 8.0
#define PB_Space_W 2

@interface PieButton : UIView {
    UILabel *titleLabel;
    UIView *colorView;
    UIButton *button;
}

- (void)setColor:(UIColor *)color;

- (void)setTitleValue:(NSString *)string;

- (void)addTarget:(id)target action:(SEL)action;
@end
