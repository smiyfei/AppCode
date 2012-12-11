//
//  DetailViewController.h
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSArray *_detailArray;
    NSArray *_detailThumbnailArray;
}

@property (nonatomic, copy) NSArray *detailArray;
@property (nonatomic, copy) NSArray *detailThumbnailArray;

- (id)initwithContentsOfObjects:(NSArray *)detailArr;
@end
