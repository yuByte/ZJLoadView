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

@property (nonatomic, strong) ZJLoadView *myLoadView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.myLoadView];

}

- (IBAction)start:(id)sender
{
    [self.myLoadView startAnimation];

}
- (IBAction)pause:(id)sender
{
    [self.myLoadView endAnimation];
}

-(ZJLoadView *)myLoadView
{
    if (_myLoadView== nil)
    {
        _myLoadView = [[ZJLoadView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _myLoadView.layer.cornerRadius = 5;
        _myLoadView.backgroundColor = [UIColor blackColor];
        _myLoadView.alpha = 0.3;
        _myLoadView.center = self.view.center;
    }
    return _myLoadView;
}
@end
