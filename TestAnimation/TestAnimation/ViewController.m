//
//  ViewController.m
//  TestAnimation
//
//  Created by Nick on 15-3-4.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import "ViewController.h"
#import "ZJLoadView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZJLoadView *loadView = [[ZJLoadView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    loadView.layer.cornerRadius = 5;
    loadView.backgroundColor = [UIColor blackColor];
    loadView.alpha = 0.3;
    loadView.center = self.view.center;
    [self.view addSubview:loadView];
}



@end
