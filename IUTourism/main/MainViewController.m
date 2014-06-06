//
//  MainViewController.m
//  IUTourism
//
//  Created by mac on 14-6-6.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dangjirexiao:(UIButton *)sender {
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

- (IBAction)shuaimai:(UIButton *)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=shm";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"甩卖"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)zizhuyou:(id)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=zzy";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"自助游"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}

- (IBAction)shanglv:(id)sender {
    NSString * urlString = @"http://115.28.175.177:8080/tourPhone/index.htm?oper=shl";
    NSURL * url = [NSURL URLWithString:urlString];
    cellCtl = [[CellViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:url AndWithTitle:@"商旅"];
    [self.navigationController pushViewController:cellCtl animated:YES];
}
@end
