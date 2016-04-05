//
//  RegexService.m
//  SmartCard
//
//  Created by Andy Malik on 4/5/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "RegexService.h"

NSString *const emailRegexValidationString = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$";
NSString *const phoneRegexValidationString = @"^(\\(?[0-9]{3}\\)?)?[\\s.-]?[0-9]{3}[\\s.-]?[0-9]{4}$";

@implementation RegexService

+(BOOL)regexValidationForString:(NSString *)string withRegex:(NSString *)regexString {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    if (error) {
        NSLog(@"REGEX ERROR: %@", [error localizedDescription]);
        return NO;
    }
    
    NSArray *regexMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    if (regexMatches.count > 0) {
        return YES;
    }
    
    return NO;
}

@end
