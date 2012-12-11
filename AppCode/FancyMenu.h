//
//  FancyMenu.h
//  AppCode
//
//  Created by 杨飞 on 12/11/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FancyMenuDelegate;

@interface FancyMenu : UIView

@property (nonatomic, assign) id<FancyMenuDelegate> delegate;

@end

@protocol FancyMenuDelegate <NSObject>
@optional

@end
