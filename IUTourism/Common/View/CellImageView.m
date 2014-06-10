//
//  CellImageView.m
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "CellImageView.h"
#import "UIImageView+AFNetworking.h"

@implementation CellImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame WithImageUrl:(NSString *)imageString AndWithTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        float width = frame.size.width;
        float height = frame.size.height;
        cellImage = imageString;
        cellTitle = title;
        [self initViewWithWidth:width AndWithHeight:height];
    }
    return self;
}



- (void)initViewWithWidth:(float)width AndWithHeight:(float)height
{
    float lable_height = 35.0f;
    
    UIImageView * imageView = [[UIImageView alloc]init];
    [imageView setFrame:CGRectMake(0, 0, width, height)];
    [imageView setImageWithURL:[NSURL URLWithString:cellImage] placeholderImage:[UIImage imageNamed:@"scene"]];
    [self addSubview:imageView];
    
    UILabel * title_lable = [[UILabel alloc]init];
    [title_lable setFrame:CGRectMake(0,
                                     imageView.frame.size.height - lable_height,
                                     imageView.frame.size.width,
                                     lable_height)];
    if ([cellTitle length] > 10){
        cellTitle = [cellTitle substringToIndex:10];
    }
    [title_lable setText:cellTitle];
    [title_lable setFont:[UIFont systemFontOfSize:15.0f]];
    [title_lable setTextAlignment:NSTextAlignmentCenter];
    [title_lable setTextColor:[UIColor whiteColor]];
    [title_lable setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
    [imageView addSubview:title_lable];
    [imageView bringSubviewToFront:title_lable];
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
