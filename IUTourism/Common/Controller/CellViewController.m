//
//  CellViewController.m
//  IUTourism
//
//  Created by fankejun on 14-5-28.
//  Copyright (c) 2014年 frank. All rights reserved.
//

#import "CellViewController.h"
#import "CommonMacro.h"
#import "AFHTTPRequestOperation.h"
#import "IUMode.h"
#import "IUTourMacro.h"
#import "UIColor+Extension.h"
#import "NSString+Conversion.h"
#import "ChineseSearchEngine.h"
#import "DetailViewController.h"

@interface CellViewController ()

@property (nonatomic,readwrite) BOOL useSearchResult;
@property (nonatomic,readonly) NSArray *searchResults;

@end

@implementation CellViewController
@synthesize searchResults = _searchResults;
@synthesize useSearchResult = _useSearchResult;
@synthesize dataArray = _dataArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil AndWithUrl:(NSURL *)url AndWithTitle:(NSString *)title {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //此为资源列表页
        loadUrl = url;
        self.title = title;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setLeftBarButtonWithImage:[UIImage imageNamed:@"btn_back"]];
	[self initData];
    [self initView];
}

- (void)initData
{
    [self requestJSONWithUrl:loadUrl];
}

- (void)initView
{
    float searchBarHeight = 40.0f;
    float bound_heiht = self.view.frame.size.height;
    float bound_width = self.view.frame.size.width;
    
    mySearchBar = [[TimSearchBar alloc]init];
    [mySearchBar setFrame:CGRectMake(0, bound_heiht - searchBarHeight - 44 * ! IOS_7_OR_LATER, bound_width, searchBarHeight)];
    if (IOS_7_OR_LATER) {
        [mySearchBar setBarTintColor:[UIColor colorWithHex:VIEWCONTROLLER_BACKGROUNDCOLOR]];
    } else if (IOS_5_OR_LATER) {
        [mySearchBar setTintColor:[UIColor colorWithHex:VIEWCONTROLLER_BACKGROUNDCOLOR]];
    }
    [mySearchBar setDelegate:self];
    [self.view addSubview:mySearchBar];
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, bound_width, bound_heiht - searchBarHeight - 44 * ! IOS_7_OR_LATER) style:UITableViewStylePlain];
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    [self.view addSubview:myTableView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * pre_url = @"http://115.28.175.177:8080";
    //Get Data
    Travel * travel;
    if (_dataArray != nil && [_dataArray count] > 0){
         travel = [_dataArray objectAtIndex:indexPath.row];
    }
    NSString * title = travel.tit;
    NSString * dep = travel.dep;
    NSString * gys = travel.gys;
    NSString * url = travel.url;
    NSString * phone = travel.phone;
    
    NSString * imgUrl = [NSString stringWithFormat:@"%@%@",pre_url,url];
    static NSString * ideString = @"commCell";
    cell = [myTableView dequeueReusableCellWithIdentifier:ideString];
    if (cell == nil){
        cell = [[CommCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ideString WithHeight:110.0f AndWithTitle:title AndWithImageUrl:imgUrl];
    }
    [cell.descriptionLabel setText:dep];
    [cell.endPlaceLabel setText:gys];
    [cell.timeLabel setText:phone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * pre_url = @"http://115.28.175.177:8080/tourPhoneById/index.htm?id=";
    //Get Data
    Travel * travel;
    if (_dataArray != nil && [_dataArray count] > 0){
        travel = [_dataArray objectAtIndex:indexPath.row];
    }
    NSString * travelID = travel.id;
    NSString * detailIndexString = [NSString stringWithFormat:@"%@%@",pre_url,travelID];
    DetailViewController * detailCtl = [[DetailViewController alloc]initWithNibName:nil bundle:nil AndWithUrl:detailIndexString];
    [self.navigationController pushViewController:detailCtl animated:YES];
}

#pragma mark -  UISearchBar Delegates
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if ([searchText isEmpty]) {
        _useSearchResult = NO;
        [myTableView reloadData];
        return;
    }
    
    _searchResults = nil;
    _searchResults = [ChineseSearchEngine resultArraySearchTravelOnArray:_dataArray withSearchText:searchText];
    _useSearchResult = YES;
    [myTableView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchBar.text = nil;
    [searchBar setShowsCancelButton:NO animated:YES];
}

#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [mySearchBar resignFirstResponder];
}

#pragma mark - keyboard method
-(void)autoMovekeyBoard:(float)h//监听要实现的方法，界面上移下移
{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = CGRectMake(0, 0-h, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }];
}

//键盘监听的实现
-(void)keyboardWillShow:(NSNotification *)notification//向上移动
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [self autoMovekeyBoard:(float)keyboardRect.size.height-64*IOS_7_OR_LATER];
}
-(void)keyboardWillHide:(NSNotification *)notification//向下移动
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [self autoMovekeyBoard:0-64*IOS_7_OR_LATER];
}

#pragma mark - Http Request
- (void)requestJSONWithUrl:(NSURL *)url
{
    //接受数据的数组
    NSMutableArray * tempArray = [[NSMutableArray alloc]initWithCapacity:0];
    //开始请求
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation,id JSON){
        NSString * resultString = operation.responseString;
        NSData * resultData = [[NSData alloc]initWithData:[resultString dataUsingEncoding:NSUTF8StringEncoding]];
        //Json解析
        NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
        if (resultDic !=nil && [resultDic count] > 0){
            if ([[resultDic objectForKey:@"success"] isEqualToString:@"true"]){
                NSDictionary * infoDic = [resultDic objectForKey:@"info"];
                for (NSDictionary * dic in infoDic) {
                    Travel * travel = [[Travel alloc]init];
                    travel.id = [dic objectForKey:@"id"];
                    travel.tit = [dic objectForKey:@"tit"];
                    travel.url = [dic objectForKey:@"url"];
                    travel.gys = [dic objectForKey:@"gys"];
                    travel.phone = [dic objectForKey:@"phone"];
                    travel.dep = [dic objectForKey:@"dep"];
                    [tempArray addObject:travel];
                }
                _dataArray = [NSArray arrayWithArray:tempArray];
            }
        }
        [myTableView reloadData];
    }failure:^(AFHTTPRequestOperation * operation,NSError * error){
        NSLog(@"requestFail:%@",error);
    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
