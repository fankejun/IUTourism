//
//  NSString+Conversion.m
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "NSString+Conversion.h"

@implementation NSString (Conversion)

- (NSDate *)stringToNSDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

@end


@implementation NSString (Empty)

- (BOOL)isEmpty {
    
    if (self == nil || self.length < 1 || [self isEqual:[NSNull null]]) {
        return YES;
    }
    
    if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        //string is all whitespace
        return YES;
    }

    return NO;
}

+ (BOOL)isEmptyString:(NSString *)str {
    
    if (str == nil || str.length < 1 || [str isEqual:[NSNull null]]) {
        return YES;
    }
    
    if (![[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        return  YES;
    }
    
    return NO;
}

@end