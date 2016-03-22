//
//  TemplateStore.h
//  SmartCard
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TemplateA.h"
#import "TemplateB.h"
#import "TemplateC.h"
#import "TemplateD.h"
#import "TemplateE.h"
#import "TemplateF.h"
#import "TemplateG.h"

@interface TemplateStore : NSObject

@property(strong, nonatomic)NSArray *templates;

+(instancetype)shared;

@end
