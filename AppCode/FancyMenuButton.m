//
//  FancyMenuButton.m
//  AppCode
//
//  Created by 杨飞 on 12/12/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//
#define DegreesToRadians(degrees) (degrees * M_PI / 180.f)

#import "FancyMenuButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation FancyMenuButton

@synthesize degree = _degree;
@synthesize buttonState = _buttonState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //acturalPosition.x = position.x + width*(0.5 - anchor_point.x);
        //acturalPosition.y = position.y + height*(0.5 - anchor_point.y)
        //相对于当前degree的高度偏移
        self.layer.position = CGPointMake(frame.size.width/2 + frame.origin.x, frame.size.height);
        self.layer.anchorPoint = CGPointMake(0.5,1.0f);
    }
    
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CABasicAnimation *animation = (CABasicAnimation *)anim;
    if ([animation.keyPath isEqualToString:@"transform"] && flag)
    {
        switch (self.buttonState) {
            case FadeIn:
                [self.layer addAnimation:[self rotateAnimationFromDegree:0 toDegree:self.degree delegate:nil] forKey:@"FancyButtonRotation"];
                self.transform = CGAffineTransformMakeRotation(DegreesToRadians(self.degree));
                break;
            case FadeOut:
                self.hidden = YES;
            default:
                break;
        }
    }
    else if ([animation.keyPath isEqualToString:@"transform.rotation.z"] && flag)
    {
        [self.layer addAnimation:[self fadeOutAnimation] forKey:@"FancyButtonFadeOut"];
        self.transform = CGAffineTransformMakeRotation(DegreesToRadians(self.degree));
    }
}

- (CABasicAnimation *)fadeInAnimation
{
    self.buttonState = FadeIn;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(.01, .01, .1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.duration = 0.1;
    scaleAnimation.delegate = self;
    return scaleAnimation;
}

- (CABasicAnimation *)fadeOutAnimation
{
    self.buttonState = FadeOut;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(.01, .01, .1)];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.duration = 0.1;
    scaleAnimation.delegate = self;
    return scaleAnimation;
}

- (CABasicAnimation *)rotateAnimationFromDegree:(CGFloat)from toDegree:(CGFloat)to delegate:(id)delegate{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat: DegreesToRadians(from)];
    rotationAnimation.toValue = [NSNumber numberWithFloat: DegreesToRadians(to)];
    rotationAnimation.duration = 0.2f;
    rotationAnimation.delegate = delegate;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    return rotationAnimation;
}

- (void)hide
{
    [self.layer addAnimation:[self rotateAnimationFromDegree:self.degree toDegree:0 delegate:self] forKey:@"FancyButtonRotationBack"];
}

- (void)show
{
    self.hidden = NO;
    [self.layer addAnimation:[self fadeInAnimation] forKey:@"transform.scale"];
}
@end
