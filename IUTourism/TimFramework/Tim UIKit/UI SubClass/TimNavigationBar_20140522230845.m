//
//  TimNavigationBar.m
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "TimNavigationBar.h"
#import "UIColor+Extension.h"
#import "CommonMacro.h"

@implementation TimNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (IOS_7_OR_LATER){
            self.barTintColor = [UIColor colorWithHex:0x3f67bf];
        }else if (IOS_5_OR_LATER){
            self.tintColor = [UIColor colorWithHex:0x3f67bf];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            CGRect frame = view.frame;
            if (frame.origin.x < 30) {
                frame.origin.x = 0.f;
                frame.origin.y = 0.f;
            }else{
                frame.origin.x = 320 -45;
                frame.origin.y = 0.f;
            }
            view.frame = frame;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
