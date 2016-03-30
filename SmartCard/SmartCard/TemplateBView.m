//
//  TemplateBView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateBView.h"

@implementation TemplateBView

+(void)setUpViewWithView:(UIView*)view name:(NSString*)name firstAddress:(NSString*)firstAddress secondaryAddress:(NSString*)secondaryAddress email:(NSString*)email phone:(NSString*)phone website:(NSString*)website jobTitle:(NSString*)title company:(NSString*)company logo:(UIImage*)logo{
    
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

    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TemplateB.png"]];
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
    imageView.image = logo;
    imageView.backgroundColor = [UIColor redColor];
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 20];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -250];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 20];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -110];
    
    [backgroundImage addSubview:imageView];
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    
    UILabel *companyLabel = [[UILabel alloc ]init];
    companyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    companyLabel.text = company;
    UIFont *font = [UIFont fontWithName:@"Avenir-Book" size:20.0];
    companyLabel.font = font;
    companyLabel.textAlignment = NSTextAlignmentCenter;
    
    UIColor *textColor = [UIColor blackColor];
    companyLabel.textColor = textColor;
    
    NSLayoutConstraint *cLLLeading = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -20];
    
    NSLayoutConstraint *cLLTrailing = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -80];
    
    NSLayoutConstraint *cLLTop = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 40];
    
    NSLayoutConstraint *cLLBotton = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -130];
    
    [backgroundImage addSubview:companyLabel];
    
    cLLLeading.active = YES;
    cLLTrailing.active = YES;
    cLLTop.active = YES;
    cLLBotton.active = YES;
    
    
    UILabel *addressLabel = [[UILabel alloc ]init];
    addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    addressLabel.text = firstAddress;
    UIFont *smallFont = [UIFont fontWithName:@"ArialHebrew-Light" size:14.0];
    addressLabel.font = smallFont;
    addressLabel.textAlignment = NSTextAlignmentCenter;
    
    UIColor *smallTextColor = [UIColor blackColor];
    addressLabel.textColor = smallTextColor;
    
    NSLayoutConstraint *aLLeading = [NSLayoutConstraint constraintWithItem:addressLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: +20];
    
    NSLayoutConstraint *aLLBotton = [NSLayoutConstraint constraintWithItem:addressLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -80];
    
    [backgroundImage addSubview:addressLabel];
    
    aLLeading.active = YES;
    aLLBotton.active = YES;
    
    UILabel *secondAddressLabel = [[UILabel alloc ]init];
    secondAddressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    secondAddressLabel.text = secondaryAddress;
    UIFont *smallerFont = [UIFont fontWithName:@"ArialHebrew-Light" size:12.0];
    
    secondAddressLabel.font = smallerFont;
    
    secondAddressLabel.textAlignment = NSTextAlignmentCenter;
    
    secondAddressLabel.textColor = smallTextColor;
    
    NSLayoutConstraint *sALLeading = [NSLayoutConstraint constraintWithItem:secondAddressLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: +20];
    
    NSLayoutConstraint *sALLBotton = [NSLayoutConstraint constraintWithItem:secondAddressLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -60];
    
    [backgroundImage addSubview:secondAddressLabel];
    
    sALLeading.active = YES;
    sALLBotton.active = YES;
    
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    UIFont *nameFont = [UIFont fontWithName:@"Arial-BoldMT" size:16.0];
    nameLabel.font = nameFont;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    nameLabel.textColor = textColor;
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -30];
    
    NSLayoutConstraint *nLLBotton = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -100];
    
    [backgroundImage addSubview:nameLabel];
    nLTrailing.active = YES;
    nLLBotton.active = YES;
    
    UILabel *titleLabel = [[UILabel alloc ]init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    titleLabel.text = title;
    
    titleLabel.font = smallFont;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = textColor;
    
    NSLayoutConstraint *tLTrailing = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -30];
    
    NSLayoutConstraint *tLLBotton = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -80];
    
    [backgroundImage addSubview:titleLabel];
    tLTrailing.active = YES;
    tLLBotton.active = YES;
    
    
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    phoneLabel.text = phone;
    
    phoneLabel.font = smallFont;
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    
    phoneLabel.textColor = textColor;
    
    
    NSLayoutConstraint *pLTrailing = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -30];
    
    NSLayoutConstraint *pLBotton = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -60];
    
    [backgroundImage addSubview:phoneLabel];
    
    
    pLTrailing.active = YES;
    pLBotton.active = YES;
    
    
    UILabel *emailLabel = [[UILabel alloc]init];
    emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    emailLabel.text = email;
    
    emailLabel.font = smallerFont;
    emailLabel.textAlignment = NSTextAlignmentCenter;
    
    emailLabel.textColor = textColor;
    
    NSLayoutConstraint *eLTrailing = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -30];
    
    NSLayoutConstraint *eLBotton = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -45];
    
    [backgroundImage addSubview:emailLabel];
    
    eLBotton.active = YES;
    eLTrailing.active = YES;

}

@end
