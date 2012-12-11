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

@end

@implementation FancyMenuController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FancyMenu";  
	// Do any additional setup after loading the view.
    FancyMenu *fancyMenu = [[FancyMenu alloc] init];
    fancyMenu.delegate   = self;
    [self.view addSubview:fancyMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
