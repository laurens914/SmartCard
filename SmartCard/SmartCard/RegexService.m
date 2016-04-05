//
//  RegexService.m
//  SmartCard
//
//  Created by Andy Malik on 4/5/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "RegexService.h"

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
