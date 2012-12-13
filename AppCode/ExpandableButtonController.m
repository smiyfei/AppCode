//
//  ExpandableButtonController.m
//  AppCode
//
//  Created by 杨飞 on 12/12/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//
#import "ExpandableButtonController.h"
#import "ExpandableButton.h"


@interface ExpandableButtonController ()

@end

@implementation ExpandableButtonController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ExpandableButton";
    
	ExpandableButton *colorButton = [[[ExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 45.0f)
																	   leftTitle:@"Color"
																		 buttons:[NSArray arrayWithObjects:@"Black", @"Red", @"Green", @"Blue", nil]] autorelease];
	[[self view] addSubview:colorButton];
	[colorButton addTarget:self action:@selector(toggleColor:) forControlEvents:UIControlEventValueChanged];
    
	[[colorButton.labels objectAtIndex:0] setHighlightedTextColor:[UIColor blackColor]];
	[[colorButton.labels objectAtIndex:1] setHighlightedTextColor:[UIColor redColor]];
	[[colorButton.labels objectAtIndex:2] setHighlightedTextColor:[UIColor greenColor]];
	[[colorButton.labels objectAtIndex:3] setHighlightedTextColor:[UIColor blueColor]];
	
	ExpandableButton *borderButton = [[[ExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 90.0f)
																		leftTitle:@"Border"
																		  buttons:[NSArray arrayWithObjects:@"Thin", @"Medium", @"Thick", nil]] autorelease];
	[[self view] addSubview:borderButton];
	[borderButton addTarget:self action:@selector(toggleWidth:) forControlEvents:UIControlEventValueChanged];
	[borderButton setInnerBorderWidth:0];
	[borderButton setHorizontalPadding:6];
	[borderButton setUnSelectedLabelFont:[UIFont systemFontOfSize:borderButton.labelFont.pointSize]];
	[borderButton updateDisplay];
	[borderButton setSelectedItem:1];
    
	ExpandableButton *toggleButton = [[[ExpandableButton alloc] initWithPoint:CGPointMake(20.0f, 135.0f)
																		leftTitle:nil
																		  buttons:[NSArray arrayWithObjects:@"HDR On", @"HDR Off", nil]] autorelease];
	[[self view] addSubview:toggleButton];
	[toggleButton addTarget:self action:@selector(toggleBkgd:) forControlEvents:UIControlEventValueChanged];
	[toggleButton setToggleMode:YES];
	[toggleButton setInnerBorderWidth:0];
	[toggleButton setHorizontalPadding:6];
	[toggleButton updateDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Functions

- (void)toggleColor:(ExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		default:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor blackColor].CGColor];
			break;
		case 1:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor redColor].CGColor];
			break;
		case 2:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor greenColor].CGColor];
			break;
		case 3:
			[[[self.view viewWithTag:10] layer] setBorderColor:[UIColor blueColor].CGColor];
			break;
	}
}

- (void)toggleWidth:(ExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		default:
			[[[self.view viewWithTag:10] layer] setBorderWidth:2];
			break;
		case 1:
			[[[self.view viewWithTag:10] layer] setBorderWidth:6];
			break;
		case 2:
			[[[self.view viewWithTag:10] layer] setBorderWidth:12];
			break;
	}
}
- (void)toggleBkgd:(ExpandableButton *)sender
{
	switch ([sender selectedItem])
	{
		case 0:
			[self.view setBackgroundColor:[UIColor grayColor]];
			break;
		case 1:
			[self.view setBackgroundColor:[UIColor lightGrayColor]];
			break;
	}
}

- (void)toggleFlashlight:(ExpandableButton *)sender
{
	if (NSClassFromString(@"AVCaptureDevice") != nil)
	{
		AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		
		if ([device hasTorch])
		{
			[device lockForConfiguration:nil];
			[device setTorchMode:(2 - [sender selectedItem])];
			[device unlockForConfiguration];
		}
	}
}


@end


