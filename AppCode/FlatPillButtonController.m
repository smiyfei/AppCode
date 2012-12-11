//
//  FlatPillButtonController.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "FlatPillButtonController.h"
#import "FlatPillButton.h"

@interface FlatPillButtonController ()

@end

@implementation FlatPillButtonController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"FlatPillButton";
    
    FlatPillButton *button1 = [[FlatPillButton alloc] init];
    button1.frame = CGRectMake(10, 10, 150, 60);
    [button1 setTitle:@"normal" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button1];
    [button1 release];
    
    FlatPillButton *button2 = [[FlatPillButton alloc] init];
    button2.frame = CGRectMake(160, 10, 150, 60);
    [button2 setTitle:@"normal" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button2];
    [button2 release];
    
    FlatPillButton *button3 = [[FlatPillButton alloc] init];
    button3.frame = CGRectMake(10, 80, 150, 60);
    button3.bold = YES;
    [button3 setTitle:@"bold" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button3];
    [button3 release];
    
    FlatPillButton *button4 = [[FlatPillButton alloc] init];
    button4.frame = CGRectMake(160, 80, 150, 60);
    button4.enabled = false;
    [button4 setTitle:@"disabled" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button4];
    [button4 release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
