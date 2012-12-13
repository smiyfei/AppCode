//
//  FancyMenuButton.h
//  AppCode
//
//  Created by 杨飞 on 12/12/12.
//  Copyright (c) 2012 tongbu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    FadeIn,
    FadeOut
} FancyMenuButtonState;

@interface FancyMenuButton : UIButton

@property (nonatomic, assign) CGFloat degree;
@property (nonatomic, assign) FancyMenuButtonState buttonState;

- (void)hide;
- (void)show;
@end
