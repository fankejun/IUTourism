//
//  CommCell.m
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "CommCell.h"

@implementation CommCell
@synthesize descriptionLabel,endPlaceLabel,timeLabel,cellTitle,cellImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithHeight:(float)height AndWithTitle:(NSString *)title AndWithImageUrl:(NSString *)urlString
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        cellHeight = height;
        cellTitle = title;
        cellImage = urlString;
        [self initViewWithHeight:cellHeight];
    }
    return self;
}

- (void)initViewWithHeight:(float)height
{
    float image_mag_x = 5;
    float image_mag_y = 3;
    CGRect frame = CGRectMake(image_mag_x, image_mag_y, height * (1.4), height - image_mag_y * 2);
    //imageView默认为长方形
    imageView = [[CellImageView alloc]initWithFrame:frame WithImageUrl:cellImage AndWithTitle:cellTitle];;
    [self addSubview:imageView];
    
    float lable_mag_x = imageView.frame.size.width + 4;
    float lable_mag_y = image_mag_y;
    float lable_height = 12.0f;
    float lable_width = self.frame.size.width - imageView.frame.size.width - image_mag_x - image_mag_x * 2;
    //title的宽度
    float lable_width1 = 45.0f;
    float lable_width2 = 65.0f;
    
    descriptionLabel = [[UILabel alloc]init];
    [descriptionLabel setFrame:CGRectMake(lable_mag_x + 5, lable_mag_y, lable_width, height * 0.6)];
    [descriptionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [descriptionLabel setNumberOfLines:0];
    [descriptionLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [descriptionLabel setTextColor:[UIColor blackColor]];
    [descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:descriptionLabel];
    
//    UILabel * title1_lable = [[UILabel alloc]init];
//    [title1_lable setFrame:CGRectMake(descriptionLabel.frame.origin.x,
//                                     descriptionLabel.frame.size.height + descriptionLabel.frame.origin.y + 3,
//                                     lable_width1,
//                                      lable_height)];
//    [title1_lable setFont:[UIFont systemFontOfSize:13.0f]];
//    [title1_lable setText:@"出发地:"];
//    [title1_lable setTextColor:[UIColor grayColor]];
//    [title1_lable setBackgroundColor:[UIColor clearColor]];
//    [self addSubview:title1_lable];
//    
//    startPlaceLabel = [[UILabel alloc]init];
//    [startPlaceLabel setFrame:CGRectMake(title1_lable.frame.origin.x + title1_lable.frame.size.width,
//                                    title1_lable.frame.origin.y,
//                                    lable_width - lable_width1,
//                                    lable_height)];
//    [startPlaceLabel setFont:[UIFont systemFontOfSize:13.0f]];
//    [startPlaceLabel setLineBreakMode:NSLineBreakByWordWrapping];
//    [startPlaceLabel setTextColor:[UIColor grayColor]];
//    [startPlaceLabel setBackgroundColor:[UIColor clearColor]];
//    [self addSubview:startPlaceLabel];
    
    UILabel * title2_lable = [[UILabel alloc]init];
    [title2_lable setFrame:CGRectMake(descriptionLabel.frame.origin.x,
                                      descriptionLabel.frame.size.height + descriptionLabel.frame.origin.y + 3,
                                      lable_width1,
                                      lable_height)];
    [title2_lable setFont:[UIFont systemFontOfSize:13.0f]];
    [title2_lable setText:@"旅行社:"];
    [title2_lable setTextColor:[UIColor grayColor]];
    [title2_lable setBackgroundColor:[UIColor clearColor]];
    [self addSubview:title2_lable];
    
    endPlaceLabel = [[UILabel alloc]init];
    [endPlaceLabel setFrame:CGRectMake(title2_lable.frame.origin.x + title2_lable.frame.size.width,
                                    title2_lable.frame.origin.y,
                                    lable_width - lable_width1,
                                  lable_height)];
    [endPlaceLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [endPlaceLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [endPlaceLabel setTextColor:[UIColor grayColor]];
    [endPlaceLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:endPlaceLabel];
    
    UILabel * title3_lable = [[UILabel alloc]init];
    [title3_lable setFrame:CGRectMake(descriptionLabel.frame.origin.x,
                                      title2_lable.frame.size.height + title2_lable.frame.origin.y + 6,
                                      lable_width1,
                                      lable_height)];
    [title3_lable setFont:[UIFont systemFontOfSize:13.0f]];
    [title3_lable setText:@"电   话:"];
    [title3_lable setTextColor:[UIColor grayColor]];
    [title3_lable setBackgroundColor:[UIColor clearColor]];
    [self addSubview:title3_lable];
    
    timeLabel = [[UILabel alloc]init];
    [timeLabel setFrame:CGRectMake(title3_lable.frame.origin.x + title3_lable.frame.size.width,
                                  title3_lable.frame.origin.y,
                                  lable_width - lable_width2,
                                  lable_height)];
    [timeLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [timeLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [timeLabel setTextColor:[UIColor grayColor]];
    [timeLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:timeLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
