//
//  MainViewController.h
//  IUTourism
//
//  Created by mac on 14-6-6.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellViewController.h"
#import "TimViewController.h"

@interface MainViewController : TimViewController
{
    CellViewController * cellCtl;
}
- (IBAction)dangjirexiao:(UIButton *)sender;

- (IBAction)tesexianluClick:(UIButton *)sender;
- (IBAction)shuaimai:(UIButton *)sender;
- (IBAction)zizhuyou:(id)sender;
- (IBAction)shanglv:(id)sender;

@end
