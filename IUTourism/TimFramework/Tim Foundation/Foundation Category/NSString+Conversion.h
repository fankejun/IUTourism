//
//  NSString+Conversion.h
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Conversion)

- (NSDate *)stringToNSDate;

@end

@interface NSString (Empty)

+ (BOOL)isEmptyString:(NSString *)str;
- (BOOL)isEmpty;

@end