//
//  PieButton.m
//  MDBClient
//
//  Created by yto on 14-8-19.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import "PieButton.h"

@implementation PieButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (void)initView {
    CGFloat aH = self.frame.size.height;
    CGFloat aW = self.frame.size.width;
    CGFloat colorY = (aH-PB_View_WH)/2;
    colorView = [[UIView alloc] initWithFrame:CGRectMake(PB_Margin_LR, colorY, PB_View_WH, PB_View_WH)];
    
    CGFloat titleX = PB_Margin_LR+PB_View_WH+PB_Space_W;
    CGFloat titleW = aW-titleX-PB_Margin_LR-PB_Space_W;
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, 0, titleW, aH)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:10.0]];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, aW, aH)];
    [button setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:colorView];
    [self addSubview:titleLabel];
    [self addSubview:button];
}

- (void)setColor:(UIColor *)color {
    [colorView setBackgroundColor:color];
    [titleLabel setTextColor:color];
}

- (void)setTitleValue:(NSString *)string {
    NSLog(@"string >>>> %@",string);
    [titleLabel setText:string];
}

- (void)addTarget:(id)target action:(SEL)action {
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
