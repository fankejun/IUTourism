//
//  PH5ViewController.h
//  IUTourism
//
//  Created by mac on 14-6-9.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "TimViewController.h"
#import "CellViewController.h"

@interface PH5ViewController : TimViewController
{
    CellViewController * cellCtl;
}

- (IBAction)dangjirexaioClick:(UIButton *)sender;
- (IBAction)tesexianluClick:(UIButton *)sender;
- (IBAction)shuaimaiClick:(UIButton *)sender;
- (IBAction)zizhuyouClick:(UIButton *)sender;
- (IBAction)shanglvClick:(UIButton *)sender;

@end
