//
//  FancyMenu.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "FancyMenu.h"
#import "FancyMenuButton.h"

@interface FancyMenu()
{
    BOOL onScreen;
}

@property (nonatomic, assign) BOOL onScreen;
@end

@implementation FancyMenu

@synthesize delegate;
@synthesize onScreen;
@synthesize buttonImages = _buttonImages;

- (void)dealloc
{
    [_buttonImages release];

    [super dealloc];
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
    if (self.onScreen){ return; }
    
    UIView *superView = [recognizer view];
    CGPoint pressedPoint = [recognizer locationInView:superView];
    CGPoint newCenter = pressedPoint;
    CGSize size = self.frame.size;
    if ((pressedPoint.x - size.width/2) < 0)
    {
        newCenter.x = size.width/2;
    }
    if ((pressedPoint.x + size.width/2) > superView.frame.size.width)
    {
        newCenter.x = superView.frame.size.width - size.width/2;
    }
    if ((pressedPoint.y - size.height/2) < 0)
    {
        newCenter.y = size.height/2;
    }
    if((pressedPoint.y + size.height/2) > superView.frame.size.height)
    {
        newCenter.y = superView.frame.size.height - size.height/2;
    }
    
    self.center = newCenter;
    [self show];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.onScreen)
    {
        [self hide];
    }
}

#pragma mark -
#pragma mark Functions

- (void)show
{
    for (FancyMenuButton *button in self.subviews)
    {
        [button show];
    }
    self.onScreen = YES;
}

- (void)hide
{
    for (FancyMenuButton *button in self.subviews)
    {
        [button hide];
    }
    self.onScreen = NO;
}

- (void)addButtons
{
    UIImage *image = [_buttonImages lastObject];
    self.frame = CGRectMake(0, 0, image.size.height * 2, image.size.height * 2);
    
    if (self.subviews.count > 0)
    {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    int count = [_buttonImages count];
    CGFloat degree = 360.f / count;
    NSInteger i = 0;
    for (UIImage *image in _buttonImages)
    {
        FancyMenuButton *menuButton = [[FancyMenuButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - image.size.width/2, 0, image.size.width, image.size.height)];
        [menuButton setBackgroundImage:image forState:UIControlStateNormal];
        menuButton.degree = i * degree;
        menuButton.tag = i + 236;
        menuButton.hidden = YES;
        [menuButton addTarget:self action:@selector(menuButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        [menuButton release];
        i++;
    }
}

- (void)menuButtonClicked:(UIButton *)menuButton
{
    if (delegate && [delegate respondsToSelector:@selector(fancyMenu:didSelectedButtonAtIndex:)])
    {
        [delegate fancyMenu:self didSelectedButtonAtIndex:menuButton.tag - 236];
    }
}

- (void)setButtonImages:(NSArray *)buttonImages
{
    if (_buttonImages != buttonImages)
    {
        _buttonImages = [buttonImages copy];
    }
    [self addButtons];
}



@end
