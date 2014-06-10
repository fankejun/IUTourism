//
//  CellViewController.h
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimViewController.h"
#import "TimSearchBar.h"
#import "CommCell.h"

@interface CellViewController : TimViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    TimSearchBar * mySearchBar;
    UITableView * myTableView;
    CommCell * cell;
    float keyboardhight;
    NSURL * loadUrl;
    
    UIActivityIndicatorView * activityView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil AndWithUrl:(NSURL *)url AndWithTitle:(NSString *)title;

@property (nonatomic, retain) NSArray * dataArray;
@end
