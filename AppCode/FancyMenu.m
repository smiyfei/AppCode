//
//  FancyMenu.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "FancyMenu.h"

@implementation FancyMenu

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self addGestureRecognizerForView:newSuperview];
}

- (void)addGestureRecognizerForView:(UIView *)view
{
    [view setUserInteractionEnabled:YES];
    
    UILongPressGestureRecognizer *longRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(superviewLongPressed:)];
    [view addGestureRecognizer:longRecognizer];
    [longRecognizer release];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [view addGestureRecognizer:recognizer];
    [recognizer release];
}

#pragma mark -
#pragma mark GestureRecognizer
- (void)superviewLongPressed:(UILongPressGestureRecognizer *)recognizer
{
    NSLog(@"supreView long pressed");
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"handle tap");
}

#pragma mark -
#pragma mark Functions

- (void)show
{
    
}


@end
