//
//  CellImageView.h
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellImageView : UIView
{
    NSString * cellImage;
    NSString * cellTitle;
}

- (id)initWithFrame:(CGRect)frame WithImageUrl:(NSString *)imageString AndWithTitle:(NSString *)title;
@end
