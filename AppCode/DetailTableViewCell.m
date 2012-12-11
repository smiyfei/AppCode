//
//  DetailTableViewCell.m
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "QuartzCore/QuartzCore.h"

@implementation DetailTableViewCell

@synthesize thnumbnail = _thnumbnail;
@synthesize titleLabel = _titleLabel;
@synthesize delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _thnumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(4, 4, 50, 70)];
        [_thnumbnail setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(thnumbnailClicked:)];
        [_thnumbnail addGestureRecognizer:recognizer];
        [recognizer release];
        [self addSubview:_thnumbnail];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(62, 4, 150, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:_titleLabel];
    }
    
    return self;
}

#pragma mark - 
#pragma mark ThunmbnailClick

- (void)thnumbnailClicked:(UITapGestureRecognizer *)recognizer
{
    
    if (delegate && [delegate respondsToSelector:@selector(detailTableViewCell:didClickThunmbnail:)])
    {
        [delegate detailTableViewCell:self didClickThunmbnail:_thnumbnail];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end







