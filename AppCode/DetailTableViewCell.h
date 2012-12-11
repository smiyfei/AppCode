//
//  DetailTableViewCell.h
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailTableViewCellDelegate;

@interface DetailTableViewCell : UITableViewCell
{
    UIImageView *_thnumbnail;
    UILabel     *_titleLabel;
    id<DetailTableViewCellDelegate> delegate;
}

@property (nonatomic, retain) UIImageView   *thnumbnail;
@property (nonatomic, retain) UILabel       *titleLabel;
@property (nonatomic, assign) id<DetailTableViewCellDelegate> delegate;
@end

@protocol DetailTableViewCellDelegate <NSObject>
@optional

- (void)detailTableViewCell:(DetailTableViewCell *)detailTableViewCell didClickThunmbnail:(UIImageView *)thnumbnail;

@end