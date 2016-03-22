//
//  TemplateStore.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateStore.h"


@implementation TemplateStore


-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        TemplateA *templateA = [[TemplateA alloc]init];
        TemplateB *templateB = [[TemplateB alloc]init];
        TemplateC *templateC = [[TemplateC alloc]init];
        TemplateD *templateD = [[TemplateD alloc]init];
        TemplateE *templateE = [[TemplateE alloc]init];
        TemplateF *templateF = [[TemplateF alloc]init];
        TemplateG *templateG = [[TemplateG alloc]init];
        
        _templates = @[templateA, templateB, templateC, templateD, templateE, templateF, templateG];
        
        _savedImages = [[NSMutableArray alloc]init];

    }
    
    return self;
}

+(instancetype)shared{
    
    static TemplateStore *shared = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    
        shared = [[[self class]alloc]init];
        
        
    });
    
        return shared;
}

@end
