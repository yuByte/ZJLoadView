//
//  ZJLoadView.m
//  TestAnimation
//
//  Created by Nick on 15-3-4.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import "ZJLoadView.h"
#import <math.h>

const int kZJLoadViewCircleCount = 4;      //小圆圈个数
const CGFloat kZJLoadViewCircleRadius = 6; //小圆圈半径

#define ZJDegreeToAngle(degree) ((degree)* (M_PI/180))

@interface ZJLoadView ()

@property (nonatomic, strong) CALayer *mySuperLayer;

@end

@implementation ZJLoadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    CGSize size = self.frame.size;
    
    CGFloat minLength = size.width;
    if (size.width > size.height)
    {
        minLength = size.height;
    }
    
    CGRect  arcRect   = CGRectMake(0, 0, minLength, minLength);
    CGSize  arcSize   = CGRectInset(arcRect, kZJLoadViewCircleRadius, kZJLoadViewCircleRadius).size;
    CGPoint arcCenter = CGPointMake(minLength/2, minLength/2);
    CGFloat arcRadius = arcSize.width/2;
    
    self.mySuperLayer.frame = arcRect;
    self.mySuperLayer.position = CGPointMake(size.width/2, size.height/2);
    
    CGFloat radian    = 90 / kZJLoadViewCircleCount;
    CGFloat diameter  = kZJLoadViewCircleRadius * 2;
    NSTimeInterval beginTime = CACurrentMediaTime();
 
    for (int i = 0; i < kZJLoadViewCircleCount; i++)
    {
            CALayer *circle  = [CALayer layer];
        
            //小圈圈初始位置
            CGFloat distanceX = arcRadius * sin(ZJDegreeToAngle(i * radian)) - kZJLoadViewCircleRadius;
            CGFloat distanceY = arcRadius - arcRadius * cos(ZJDegreeToAngle(i * radian));
            CGFloat circleX   = arcCenter.x - diameter - distanceX;
            CGFloat circleY   = 0 + distanceY;
            circle.frame = CGRectMake(circleX,circleY, diameter, diameter);
        
            circle.anchorPoint = CGPointMake(0.5, 0.5);
            circle.backgroundColor = [UIColor redColor].CGColor;
            circle.cornerRadius = kZJLoadViewCircleRadius;
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            [self.mySuperLayer addSublayer:circle];
        
            //设置小圈圈路径初始起点
             anim.path = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:arcRadius startAngle:ZJDegreeToAngle(-90 - i * radian) endAngle:ZJDegreeToAngle(270 - i * radian) clockwise:YES].CGPath;
        
             anim.beginTime = beginTime + i * 0.15;
             anim.removedOnCompletion = NO;
             anim.duration = 2;
             anim.repeatCount = HUGE_VAL;
             anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
            [circle addAnimation:anim forKey:nil];
     }
}

-(CALayer *)mySuperLayer
{
    if (_mySuperLayer == nil)
    {
        _mySuperLayer = [CALayer layer];
        _mySuperLayer.anchorPoint = CGPointMake(0.5, 0.5);
        [self.layer addSublayer:_mySuperLayer];
    }
    return _mySuperLayer;
}

@end
