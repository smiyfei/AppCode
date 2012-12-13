//
//  AppCodeViewController.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "AppCodeViewController.h"
#import "DetailViewController.h"

@interface AppCodeViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_categoryTableView;
    NSArray *_categoryArray;
}

@end

@implementation AppCodeViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Category";
        _categoryArray = [[NSArray alloc] initWithObjects:@"Button",@"Calendar",@"Animation",@"Label",@"NavigationBar",@"Progress", nil];
    }
    
    return self;
}

- (void)dealloc
{
    [_categoryTableView release];
    _categoryTableView = nil;
    
    [_categoryArray release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize rect = self.view.frame.size;
	// Do any additional setup after loading the view.
    _categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.width, rect.height) style:UITableViewStylePlain];
    _categoryTableView.dataSource   = self;
    _categoryTableView.delegate     = self;
    
    [self.view addSubview:_categoryTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_categoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    cell.textLabel.text = [_categoryArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *detailArray = nil;
    switch (indexPath.row)
    {
        case 0:
        {
            detailArray = [[NSArray alloc] initWithObjects:@"FlatPillButton",@"FancyMenu",@"ExpandableButton", nil];
        }
            break;
        case 1:
        {
            detailArray = [[NSArray alloc] initWithObjects:@"CKCalendar", nil];
        }
            break;
        default:
            detailArray = [_categoryArray retain];
            break;
    }
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.detailArray = detailArray;
    [detailArray release];
    
    [detailViewController setTitle:[_categoryArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [detailViewController release];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"accessoryButtontapped");
}

@end
