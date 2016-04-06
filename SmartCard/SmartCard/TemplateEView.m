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
    
    
    Boolean isFiveORFour;
    
    
    
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 480.0)) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 568.0)))) {
        
        isFiveORFour = YES;
        
    }else{
        
        isFiveORFour = NO;
        
    }

    UIView *viewX = [[UIView alloc]init];
    viewX.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:isFiveORFour? 231.0 : 350.0];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:isFiveORFour? 132.0 : 200.0];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterXWithinMargins multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterYWithinMargins multiplier:1.0 constant:0];
    
    [view addSubview:viewX];
    
    
    width.active = YES;
    height.active = YES;
    centerX.active = YES;
    centerY.active = YES;
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TempE.png"]];
    backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *BGILeading = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeLeading multiplier:1.0 constant:isFiveORFour? 3.6 : 5];
    
    NSLayoutConstraint *BGITrailing = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:isFiveORFour? -3.6 : -5];
    
    NSLayoutConstraint *BGITop = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:isFiveORFour? -13.2 : -20];
    
    NSLayoutConstraint *BGIBottom = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:isFiveORFour? 13.2 : +20];
    
    [viewX addSubview:backgroundImage];
    
    BGILeading.active = YES;
    BGITrailing.active = YES;
    BGITop.active = YES;
    BGIBottom.active = YES;
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.backgroundColor = [UIColor redColor];

    imageView.image = logo;
    
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: isFiveORFour? 31.02 : 47];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: isFiveORFour? -145.2 : -220];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? 40.0 : 63];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: isFiveORFour? -42.54 : -69];
    
    [backgroundImage addSubview:imageView];

    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 0.25;
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    UIFont *font = [UIFont fontWithName:@"Arial" size: 18.0];
     UIFont *font2 = [UIFont fontWithName:@"Arial" size: 13];
    
    nameLabel.font = isFiveORFour? font2 : font;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.numberOfLines = 2;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    
    NSLayoutConstraint *nLLeading = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:isFiveORFour? 79.2 : 120];
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:isFiveORFour? -13.6: -20];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? 40: 60];
    
    
    [backgroundImage addSubview:nameLabel];
    
    nLLeading.active = YES;
    nLTrailing.active = YES;
    nLTop.active = YES;
    
    UILabel *phoneNumberLabel = [[UILabel alloc ]init];
    phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    phoneNumberLabel.text = phone;
    UIFont *smallFont= [UIFont fontWithName:@"BanglaSamgamMN-Bold" size:14.0];
     UIFont *smallFont2= [UIFont fontWithName:@"Arial" size:11.0];
    
    phoneNumberLabel.font = isFiveORFour ? smallFont2 : smallFont;
    phoneNumberLabel.textAlignment = NSTextAlignmentCenter;
    
    phoneNumberLabel.textColor = [UIColor whiteColor];
    
    NSLayoutConstraint *pNLLeading = [NSLayoutConstraint constraintWithItem:phoneNumberLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:isFiveORFour? 99 : 150];
    
    NSLayoutConstraint *pNLTop = [NSLayoutConstraint constraintWithItem:phoneNumberLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: nameLabel attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? 20 : 30];
    
    
    [backgroundImage addSubview:phoneNumberLabel];
    
    pNLLeading.active = YES;
    pNLTop.active = YES;
    
    return backgroundImage;
    
}

@end
