//
//  DetailViewController.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewCell.h"

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate, DetailTableViewCellDelegate>
{
    UITableView *_detailTableView;
}
@end

@implementation DetailViewController

@synthesize detailArray = _detailArray;
@synthesize detailThumbnailArray = _detailThumbnailArray;

- (id)initwithContentsOfObjects:(NSArray *)detailArr
{
    if (self == [super init])
    {
        if (_detailArray != detailArr)
        {
            _detailArray = [detailArr copy];
        }
    }
    
    return self;
}

- (void)dealloc
{
    [_detailTableView release];
    _detailTableView = nil;
    [_detailArray release];
    _detailArray = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize rect = self.view.frame.size;
    _detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.width, rect.height) style:UITableViewStylePlain];
    _detailTableView.dataSource = self;
    _detailTableView.delegate = self;
    
    [self.view addSubview:_detailTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_detailArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CellIdentifier";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.delegate = self;
    }

    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@",[_detailArray objectAtIndex:indexPath.row],@".png"]];
    cell.thnumbnail.image = image;
    cell.titleLabel.text = [_detailArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *controllerTag = [_detailArray objectAtIndex:indexPath.row];
    NSString *controllerName = [NSString stringWithFormat:@"%@%@",controllerTag,@"Controller"];
    
    Class class = NSClassFromString(controllerName);
    id instance = [[class alloc] init];
    [self.navigationController pushViewController:instance animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [instance release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

#pragma mark -
#pragma mark DetailTableViewCellDelegate

- (void)detailTableViewCell:(DetailTableViewCell *)detailTableViewCell didClickThunmbnail:(UIImageView *)thnumbnail;
{
    NSLog(@"thnumbnail is clicked");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
