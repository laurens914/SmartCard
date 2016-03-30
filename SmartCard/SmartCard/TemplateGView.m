//
//  TemplateGView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateGView.h"

@implementation TemplateGView

+(void)setUpViewWithView:(UIView*)view name:(NSString*)name firstAddress:(NSString*)firstAddress secondaryAddress:(NSString*)secondaryAddress email:(NSString*)email phone:(NSString*)phone website:(NSString*)website jobTitle:(NSString*)title company:(NSString*)company logo:(UIImage*)logo;
{
    
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
    
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TemplateG.png"]];
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
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 65];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -65];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 60];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -230];
    
    [backgroundImage addSubview:imageView];
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    UILabel *companyNameLabel = [[UILabel alloc ]init];
    companyNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    companyNameLabel.text = company;
    UIFont *font = [UIFont fontWithName:@"ArialHebrew-Light" size:18.0];
    companyNameLabel.font = font;
    companyNameLabel.textAlignment = NSTextAlignmentCenter;
    companyNameLabel.textColor = [UIColor whiteColor];
    
    UIColor *textColor = [UIColor yellowColor];
    
    
    NSLayoutConstraint *nLLeading = [NSLayoutConstraint constraintWithItem:companyNameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:companyNameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:companyNameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 80];
    
    [backgroundImage addSubview:companyNameLabel];
    
    nLLeading.active = YES;
    nLTrailing.active = YES;
    nLTop.active = YES;
    
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    nameLabel.textColor = [UIColor whiteColor];
    UIFont *smallerFont = [UIFont fontWithName:@"ArialHebrew-Light" size:15.0];
    nameLabel.font = smallerFont;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    
    NSLayoutConstraint *nxLLeading = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 125];
    
    [backgroundImage addSubview:nameLabel];
    
    nxLLeading.active = YES;
    nxLTrailing.active = YES;
    nxLTop.active = YES;
    
    
    
    UILabel *titleLabel = [[UILabel alloc ]init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    titleLabel.text = title;
    titleLabel.font = smallerFont;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    titleLabel.textColor = textColor;
    
    NSLayoutConstraint *tLLeading = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *tLTrailing = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *tLTop = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 145];
    
    [backgroundImage addSubview:titleLabel];
    
    tLLeading.active = YES;
    tLTrailing.active = YES;
    tLTop.active = YES;
    
    
    UILabel *emailLabel = [[UILabel alloc ]init];
    emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIFont *smallestFont = [UIFont fontWithName:@"ArialHebrew-Light" size:12.0];
    
    emailLabel.text = email;
    
    emailLabel.font = smallestFont;
    
    emailLabel.textAlignment = NSTextAlignmentCenter;
    emailLabel.textColor = [UIColor whiteColor];
    
    
    NSLayoutConstraint *eLLeading = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *eLTrailing = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *eLTop = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 165];
    
    [backgroundImage addSubview:emailLabel];
    
    eLLeading.active = YES;
    eLTrailing.active = YES;
    eLTop.active = YES;
    
    UILabel *websiteLabel = [[UILabel alloc ]init];
    websiteLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    websiteLabel.text = company;
    websiteLabel.font = smallerFont;
    websiteLabel.textAlignment = NSTextAlignmentCenter;
    
    
    websiteLabel.textColor = textColor;
    
    NSLayoutConstraint *wLLeading = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *wLTrailing = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *wLTop = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 220];
    
    [backgroundImage addSubview:websiteLabel];
    
    wLLeading.active = YES;
    wLTrailing.active = YES;
    wLTop.active = YES;
    
    
    UILabel *numberLabel = [[UILabel alloc ]init];
    numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    numberLabel.text = phone;
    
    numberLabel.font = smallestFont;
    numberLabel.textAlignment = NSTextAlignmentCenter;
    
    
    numberLabel.textColor =  [UIColor whiteColor];
    
    NSLayoutConstraint *nxxLLeading = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxxLTrailing = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *nxxLTop = [NSLayoutConstraint constraintWithItem:numberLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 240];
    
    [backgroundImage addSubview:numberLabel];
    
    nxxLLeading.active = YES;
    nxxLTrailing.active = YES;
    nxxLTop.active = YES;

}

@end
