//
//  FancyMenuController.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "FancyMenuController.h"
#import "FancyMenu.h"

@interface FancyMenuController () <FancyMenuDelegate>

@property (nonatomic, retain) FancyMenu *fancyMenu;
@end

@implementation FancyMenuController

@synthesize fancyMenu = _fancyMenu;

- (void)dealloc
{
    [_fancyMenu release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FancyMenu";  

    NSArray *buttonImages = @[[UIImage imageNamed:@"petal-twitter.png"],[UIImage imageNamed:@"petal-facebook.png"],[UIImage imageNamed:@"petal-email.png"],[UIImage imageNamed:@"petal-save.png"]];
    _fancyMenu = [[FancyMenu alloc] init];
    _fancyMenu.delegate   = self;
    _fancyMenu.buttonImages = buttonImages;
    [self.view addSubview:_fancyMenu];
    
    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tip.textAlignment = NSTextAlignmentCenter;
    [tip setText:@"长按屏幕显示菜单"];
    [tip setFont:[UIFont systemFontOfSize:18]];
    [self.view addSubview:tip];
    [tip release];
    [self.view bringSubviewToFront:_fancyMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark FancyMenuButtonDelegate

- (void)fancyMenu:(FancyMenu *)fancyMenu didSelectedButtonAtIndex:(NSUInteger)index
{
    NSLog(@"selected button index:%d",index);
}

@end
