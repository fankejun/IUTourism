//
//  CommCell.h
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellImageView.h"

@interface CommCell : UITableViewCell
{
    CellImageView * imageView;
    float cellHeight;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithHeight:(float)height AndWithTitle:(NSString *)title AndWithImageUrl:(NSString *)urlString;

@property (nonatomic, copy)NSString * cellTitle;
@property (nonatomic, copy)NSString * cellImage;
@property (nonatomic, retain)UILabel * descriptionLabel;
//@property (nonatomic, retain)UILabel * startPlaceLabel;
@property (nonatomic, retain)UILabel * endPlaceLabel;
@property (nonatomic, retain)UILabel * timeLabel;
@end
