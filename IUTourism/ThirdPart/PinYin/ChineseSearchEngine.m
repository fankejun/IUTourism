//
//  ChineseSearchEngine.m
//  CRM
//
//  Created by TimTiger on 5/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "ChineseSearchEngine.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import "IUMode.h"

@implementation ChineseSearchEngine


//+ (NSArray *)resultArraySearchIntroducerOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText {
//    NSMutableArray *searchResults = [NSMutableArray arrayWithCapacity:0];
//
//    if (searchText.length>0&&![ChineseInclude isIncludeChineseInString:searchText]) {
//        for (int i=0; i<dataArray.count; i++) {
//            if ([ChineseInclude isIncludeChineseInString:dataArray[i]]) {
//                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:dataArray[i]];
//                NSRange titleResult=[tempPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleResult.length>0) {
//                    [searchResults addObject:dataArray[i]];
//                }
//                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:dataArray[i]];
//                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleHeadResult.length>0) {
//                    [searchResults addObject:dataArray[i]];
//                }
//            }
//            else {
//                NSRange titleResult=[dataArray[i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleResult.length>0) {
//                    [searchResults addObject:dataArray[i]];
//                }
//            }
//        }
//    } else if (searchText.length>0&&[ChineseInclude isIncludeChineseInString:searchText]) {
//        for (NSString *tempStr in dataArray) {
//            NSRange titleResult=[tempStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            if (titleResult.length>0) {
//                [searchResults addObject:tempStr];
//            }
//        }
//    }
//    
//    return searchResults;
//}


+ (NSArray *)resultArraySearchTravelOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText {
        NSMutableArray *searchResults = [NSMutableArray arrayWithCapacity:0];
    if (searchText.length>0&&![ChineseInclude isIncludeChineseInString:searchText]) {
        for (int i=0; i<dataArray.count; i++) {
            Travel * travel = [dataArray objectAtIndex:i];
            if ([ChineseInclude isIncludeChineseInString:travel.tit]) {
                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:travel.tit];
                NSRange titleResult=[tempPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:travel];
                }
                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:travel.tit];
                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleHeadResult.length>0) {
                    [searchResults addObject:travel];
                }
            }
            else {
                NSRange titleResult=[travel.tit rangeOfString:searchText options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:travel];
                }
            }
        }
    } else if (searchText.length>0&&[ChineseInclude isIncludeChineseInString:searchText]) {
        for (Travel *travel in dataArray) {
            NSRange titleResult=[travel.tit rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (titleResult.length>0) {
                [searchResults addObject:travel];
            }
        }
    }
    return searchResults;
}

//+ (NSArray *)resultArraySearchPatientsOnArray:(NSArray *)dataArray withSearchText:(NSString *)searchText {
//    NSMutableArray *searchResults = [NSMutableArray arrayWithCapacity:0];
//    if (searchText.length>0&&![ChineseInclude isIncludeChineseInString:searchText]) {
//        for (int i=0; i<dataArray.count; i++) {
//            Patient *patient = [dataArray objectAtIndex:i];
//            if ([ChineseInclude isIncludeChineseInString:patient.name]) {
//                NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:patient.name];
//                NSRange titleResult=[tempPinYinStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleResult.length>0) {
//                    [searchResults addObject:patient];
//                }
//                NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:patient.name];
//                NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleHeadResult.length>0) {
//                    [searchResults addObject:patient];
//                }
//            }
//            else {
//                NSRange titleResult=[patient.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
//                if (titleResult.length>0) {
//                    [searchResults addObject:patient];
//                }
//            }
//        }
//    } else if (searchText.length>0&&[ChineseInclude isIncludeChineseInString:searchText]) {
//        for (Patient *tmpPatient in dataArray) {
//            NSRange titleResult=[tmpPatient.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            if (titleResult.length>0) {
//                [searchResults addObject:tmpPatient];
//            }
//        }
//    }
//    return searchResults;
//}

@end
