//
//  FlatPillButton.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "FlatPillButton.h"

const CGFloat kFlatPillButtonBoldLineWidth = 3.0;
const CGFloat kFlatPillButtonNormalLineWidth = 2.0;

@implementation FlatPillButton

@synthesize bold;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //获取上下文环境
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef strokeColor;
    CGColorRef fillColor;
    
    switch (self.state)
    {
        case UIControlStateHighlighted:
        case UIControlStateSelected:
        {
            strokeColor = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
            fillColor   = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
        }
            break;
        case UIControlStateDisabled:
        {
            strokeColor = [self titleColorForState:UIControlStateDisabled] ? [self titleColorForState:UIControlStateDisabled].CGColor : [UIColor blackColor].CGColor;
            fillColor   = [self titleColorForState:UIControlStateDisabled] ? [self titleColorForState:UIControlStateDisabled].CGColor : [UIColor blackColor].CGColor;
        }
            break;
        default:
        {
            strokeColor = [self titleColorForState:UIControlStateNormal] ? [self titleColorForState:UIControlStateNormal].CGColor : [UIColor blackColor].CGColor;
            fillColor = [UIColor clearColor].CGColor;
        }
            break;
    }
    
    CGContextSetStrokeColorWithColor(context, strokeColor);//线条
    CGContextSetFillColorWithColor(context, fillColor);//填充
    
    CGContextSaveGState(context);
    
//    CGColorRef test = [UIColor brownColor].CGColor;
//    CGContextSetStrokeColorWithColor(context, test);
    //绘制
    CGFloat lineWidth = self.bold ? kFlatPillButtonBoldLineWidth : kFlatPillButtonNormalLineWidth;
    
    CGContextSetLineWidth(context, lineWidth);
    UIBezierPath *outlinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, lineWidth, lineWidth) cornerRadius:self.bounds.size.height/2];
    
    CGContextAddPath(context, outlinePath.CGPath);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    if (self.highlighted)
    {
        CGContextSaveGState(context);
        UIBezierPath *fillPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, lineWidth * 2.5, lineWidth * 2.5) cornerRadius:self.bounds.size.height/2];
        
        CGContextAddPath(context, fillPath.CGPath);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self setNeedsDisplay];
}

@end
