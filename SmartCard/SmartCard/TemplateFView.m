//
//  TemplateFView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateFView.h"

@implementation TemplateFView

+(void)setUpViewWithView:(UIView*)view name:(NSString*)name email:(NSString*)email phone:(NSString*)phone logo:(UIImage*)logo{
    
    UIView *viewX = [[UIView alloc]init];
    viewX.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:350.0];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterXWithinMargins multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterYWithinMargins multiplier:1.0 constant:0];
    
    [view addSubview:viewX];
    
    width.active = YES;
    height.active = YES;
    centerX.active = YES;
    centerY.active = YES;
    
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TemplateF.png"]];
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
    
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.backgroundColor = [UIColor redColor];
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 65];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -65];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 20];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -270];
    
    [backgroundImage addSubview:imageView];
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    UIFont *font = [UIFont fontWithName:@"Avenir-Book" size:20.0];
    nameLabel.font = font;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    UIColor *textColor = [UIColor whiteColor];
    nameLabel.textColor = textColor;
    
    NSLayoutConstraint *nLLeading = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 190];
    
    [backgroundImage addSubview:nameLabel];
    
    nLLeading.active = YES;
    nLTrailing.active = YES;
    nLTop.active = YES;
    
    
    UILabel *numberLabel = [[UILabel alloc ]init];
    numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    numberLabel.text = phone;
    UIFont *smallerFont = [UIFont fontWithName:@"Avenir-Book" size:18.0];
    numberLabel.font = smallerFont;
    numberLabel.textAlignment = NSTextAlignmentCenter;
    
    
    numberLabel.textColor = textColor;
    
    NSLayoutConstraint *nxLLeading = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxLTrailing = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxLTop = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 220];
    
    [backgroundImage addSubview:numberLabel];
    
    nxLLeading.active = YES;
    nxLTrailing.active = YES;
    nxLTop.active = YES;
    
    
    UILabel *emailLabel = [[UILabel alloc ]init];
    emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    emailLabel.text = email;
    emailLabel.font = smallerFont;
    emailLabel.textAlignment = NSTextAlignmentCenter;
    
    
    emailLabel.textColor = textColor;
    
    NSLayoutConstraint *eLLeading = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *eLTrailing = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *eLTop = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 245];
    
    [backgroundImage addSubview:emailLabel];
    
    eLLeading.active = YES;
    eLTrailing.active = YES;
    eLTop.active = YES;
}

@end
