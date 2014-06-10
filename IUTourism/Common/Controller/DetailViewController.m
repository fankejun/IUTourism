//
//  DetailViewController.m
//  IUTourism
//
//  Created by mac on 14-6-6.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonMacro.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil AndWithUrl:(NSString *)urlString
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setLeftBarButtonWithImage:[UIImage imageNamed:@"btn_back"]];
        self.title = @"详情";
        loadUrlString = urlString;
    }
    return self;
}

- (void)onLeftButtonAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL * loadUrl = [NSURL URLWithString:loadUrlString];
    myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [myWebView setDelegate:self];
    NSURLRequest * request = [NSURLRequest requestWithURL:loadUrl];
    [myWebView loadRequest:request];
    [self.view addSubview:myWebView];
    
    //init activity
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [activityView setColor:[UIColor blueColor]];
    [activityView startAnimating];
    [self.view addSubview:activityView];
}

#pragma mark UIWebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView stopAnimating];
    [activityView setHidden:YES];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityView stopAnimating];
    [activityView setHidden:YES];
    NSLog(@"error:%@",error.description);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
