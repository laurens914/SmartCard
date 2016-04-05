//
//  TemplateEView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateEView.h"

@implementation TemplateEView

+(UIImageView*)setUpViewWithView:(UIView*)view name:(NSString*)name phone:(NSString*)phone  logo:(UIImage*)logo{
    
    
    UIView *viewX = [[UIView alloc]init];
    viewX.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:350.0];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterXWithinMargins multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterYWithinMargins multiplier:1.0 constant:0];
    
    [view addSubview:viewX];
    
    
    width.active = YES;
    height.active = YES;
    centerX.active = YES;
    centerY.active = YES;
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TempE.png"]];
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

    imageView.image = logo;
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 42];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -220];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 52];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -50];
    
    [backgroundImage addSubview:imageView];
    
//    imageView.transform = CGAffineTransformMakeRotation(0.785);
    imageView.layer.cornerRadius = 12.0;
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    UIFont *font = [UIFont fontWithName:@"BanglaSamgamMN-Bold" size:21.0];
    nameLabel.font = font;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    nameLabel.textColor = [UIColor whiteColor];
    
    NSLayoutConstraint *nLLeading = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 150];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 85];
    
    
    [backgroundImage addSubview:nameLabel];
    
    nLLeading.active = YES;
    nLTop.active = YES;
    
    UILabel *phoneNumberLabel = [[UILabel alloc ]init];
    phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    phoneNumberLabel.text = phone;
    UIFont *smallFont= [UIFont fontWithName:@"BanglaSamgamMN-Bold" size:14.0];
    phoneNumberLabel.font = smallFont;
    phoneNumberLabel.textAlignment = NSTextAlignmentCenter;
    
    phoneNumberLabel.textColor = [UIColor whiteColor];
    
    NSLayoutConstraint *pNLLeading = [NSLayoutConstraint constraintWithItem:phoneNumberLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 150];
    
    NSLayoutConstraint *pNLTop = [NSLayoutConstraint constraintWithItem:phoneNumberLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 120];
    
    
    [backgroundImage addSubview:phoneNumberLabel];
    
    pNLLeading.active = YES;
    pNLTop.active = YES;
    
    return backgroundImage;
    
}

@end
