//
//  PH5ViewController.m
//  IUTourism
//
//  Created by mac on 14-6-9.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "PH5ViewController.h"
#import "CommonMacro.h"
#import "TimNavigationBar.h"

@interface PH5ViewController ()

@end

@implementation PH5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //设置导航条 背景色
    if (IOS_7_OR_LATER) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headImage"] forBarMetrics:UIBarMetricsDefault];
    } else if(IOS_5_OR_LATER) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"headImage"] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    //设置导航条 背景色
    if (IOS_7_OR_LATER) {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    } else if(IOS_5_OR_LATER) {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IOS_7_OR_LATER){
        [self.view setFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    } else {
        [self.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dangjirexaioClick:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=djrx";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"当季热销"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)tesexianluClick:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=tslx";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"特色线路"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)shuaimaiClick:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=shm";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"甩卖"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)zizhuyouClick:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=zzy";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"自助游"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)shanglvClick:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=shl";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"商旅"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}
@end
