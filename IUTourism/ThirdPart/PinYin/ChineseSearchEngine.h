//
//  ChineseSearchEngine.h
//  CRM
//
//  Created by TimTiger on 5/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseSearchEngine : NSObject

//+ (NSArray *)resultArraySearchIntroducerOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText;
//+ (NSArray *)resultArraySearchPatientsOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText;
+ (NSArray *)resultArraySearchTravelOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText;

@end
