//
//  MainViewController.m
//  Pie
//
//  Created by yto on 14-10-23.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *colorArray = [NSArray arrayWithObjects:COLOR(54.0, 94.0, 150.0, 1.0),
                      COLOR(152.0, 51.0, 52.0, 1.0),
                      COLOR(119.0, 151.0, 61.0, 1.0),
                      COLOR(93.0, 67.0, 124.0, 1.0),
                      COLOR(54.0, 135.0, 159.0, 1.0),
                      COLOR(209.0, 112.0, 47.0, 1.0),
                      COLOR(129.0, 151.0, 197.0, 1.0),
                      COLOR(196.0, 127.0, 128.0, 1.0),
                      COLOR(172.0, 197.0, 132.0, 1.0),
                      COLOR(152.0, 135.0, 177.0, 1.0),
                      COLOR(129.0, 183.0, 202.0, 1.0),nil];
    
    NSArray *dataArray = @[@"300",@"350",@"400",@"250",@"1000",@"200",@"300"];
    
    pieView = [[PieView alloc] initWithFrame:CGRectMake(20, 50, 200, 200) withColors:colorArray withDatas:dataArray];
    [pieView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:pieView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
