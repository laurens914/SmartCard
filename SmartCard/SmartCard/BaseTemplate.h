//
//  BaseTemplate.h
//  SmartCard
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface BaseTemplate : NSObject

@property(strong, nonatomic)NSString *firstName;
@property(strong, nonatomic)NSString *lastName;
@property(strong, nonatomic)NSString *email;
@property(strong, nonatomic)NSString *phone;
@property(strong, nonatomic)NSString *webSite;
@property(strong, nonatomic)NSString *location;
@property(strong, nonatomic)NSString *companyName;
@property(strong, nonatomic)NSString *position;

@property(strong, nonatomic)NSDate *dOB;
@property(strong, nonatomic)UIImage *logoImage;
@property(strong, nonatomic)UIImage *backgroundImage;

@end
