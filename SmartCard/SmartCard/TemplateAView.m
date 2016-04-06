//
//  TemplateAView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateAView.h"

@implementation TemplateAView


+(UIImageView*)setUpViewWithView:(UIView*)view website:(NSString*)website{
    
    float viewXWidth;
    float viewXHeight;
    float websiteTop;
    float fontSize;
    
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 480.0)) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 568.0)))) {
        
        viewXWidth = 231.0;
        viewXHeight = 132.0;
        websiteTop = 60.0;
        fontSize = 16.0;

    }else{
        viewXWidth = 350.0;
        viewXHeight = 200.0;
        websiteTop = 90.0;
        fontSize = 20.0;
        
    }
    
    UIView *viewX = [[UIView alloc]init];
    viewX.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:viewXWidth];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:viewXHeight];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterXWithinMargins multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterYWithinMargins multiplier:1.0 constant:0];
    
    [view addSubview:viewX];
    
    width.active = YES;
    height.active = YES;
    centerX.active = YES;
    centerY.active = YES;
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tempA.png"]];

    backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *BGILeading = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *BGITrailing = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *BGITop = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:-20];
    
    NSLayoutConstraint *BGIBottom = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:+20];
    
    [viewX addSubview:backgroundImage];
    
    BGILeading.active = YES;
    BGITrailing.active = YES;
    BGITop.active = YES;
    BGIBottom.active = YES;
    
    
    UILabel *websiteLabel = [[UILabel alloc ]init];
    websiteLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    websiteLabel.text = website;
    UIFont *font = [UIFont fontWithName:@"GeezaPro" size:fontSize];
    websiteLabel.font = font;
    websiteLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIColor *textColor = [UIColor colorWithRed:76.0 / 255.0 green:214.0 / 255.0 blue:102.0 / 255.0 alpha:1.0];
    websiteLabel.textColor = textColor;
    
    NSLayoutConstraint *MLLeading = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *MlTrailing = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *MlTop = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: websiteTop];
    
    
    [backgroundImage addSubview:websiteLabel];
    
    MLLeading.active = YES;
    MlTrailing.active = YES;
    MlTop.active = YES;
    
    return backgroundImage;

}




@end
