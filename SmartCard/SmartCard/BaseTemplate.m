//
//  BaseTemplate.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "BaseTemplate.h"

@implementation BaseTemplate

-(NSArray *)templateImages
{
    _templateImages = @[[UIImage imageNamed:@"TemplateA.png"], [UIImage imageNamed:@"TemplateB.png"],[UIImage imageNamed:@"TemplateC.png"], [UIImage imageNamed:@"TemplateD.png"], [UIImage imageNamed:@"TemplateE"], [UIImage imageNamed:@"TemplateF"], [UIImage imageNamed:@"TemplateG.png"]];
    
    return _templateImages;
}
@end
