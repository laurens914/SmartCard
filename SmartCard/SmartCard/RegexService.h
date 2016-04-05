//
//  RegexService.h
//  SmartCard
//
//  Created by Andy Malik on 4/5/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegexService : NSObject

+(BOOL)regexValidationForString:(NSString *)string withRegex:(NSString *)regex;

@end
