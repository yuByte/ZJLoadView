//
//  ZJLoadView.m
//  TestAnimation
//
//  Created by Nick on 15-3-4.
//  Copyright (c) 2015年 onebyte. All rights reserved.
//

#import "ZJLoadView.h"

#define ZJLoadViewCircleCount  5   //小圆圈个数
#define ZJLoadViewCircleRadius 5  //小圆圈半径
#define ZJDegreeToAngle(degree) ((degree)* (M_PI/180))

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
    CGFloat diameter = ZJLoadViewCircleRadius * 2;
    CGSize size = self.frame.size;
    NSTimeInterval beginTime = CACurrentMediaTime() ;
    CGSize arcSize = CGRectMake(ZJLoadViewCircleRadius, ZJLoadViewCircleRadius, size.width - diameter, size.height - diameter).size;
    
    for (int i = 0; i < ZJLoadViewCircleCount; i++)
    {
            CALayer *circle  = [CALayer layer];
            circle.anchorPoint = CGPointMake(0.5, 0.5);
            circle.cornerRadius = ZJLoadViewCircleRadius;
            circle.backgroundColor = [UIColor whiteColor].CGColor;
            circle.frame = CGRectMake(size.width/2 - ZJLoadViewCircleRadius , 0, diameter,diameter);
            [self.layer addSublayer:circle];;
            
             CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
             anim.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2, size.height/2) radius:arcSize.width/2 startAngle:ZJDegreeToAngle(-90 - i * 15) endAngle:ZJDegreeToAngle(270 - i * 15) clockwise:YES].CGPath;
             anim.beginTime = beginTime + i * 0.15;
             anim.duration = 2;
             anim.removedOnCompletion = NO;
             anim.repeatCount = HUGE_VAL;
             anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
            [circle addAnimation:anim forKey:nil];
     }
}




@end
