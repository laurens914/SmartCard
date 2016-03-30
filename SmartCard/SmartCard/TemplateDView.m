//
//  TemplateDView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateDView.h"

@implementation TemplateDView

+(void)setUpViewWithView:(UIView*)view name:(NSString*)name phone:(NSString*)phone website:(NSString*)website jobTitle:(NSString*)title company:(NSString*)company logo:(UIImage*)logo{
    
    
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
    
    
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TemplateD.png"]];
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
    
    NSLayoutConstraint *IVLeading = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 25];
    
    NSLayoutConstraint *IVTrailing = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -232];
    
    NSLayoutConstraint *IVTop = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 25];
    
    NSLayoutConstraint *IVBotton = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: -83];
    
    [backgroundImage addSubview:imageView];
    
    IVLeading.active = YES;
    IVTrailing.active = YES;
    IVTop.active = YES;
    IVBotton.active = YES;
    
    UILabel *companyLabel = [[UILabel alloc ]init];
    companyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    companyLabel.text = company;
    UIFont *font = [UIFont fontWithName:@"Copperplate" size:22.0];
    companyLabel.font = font;
    companyLabel.textAlignment = NSTextAlignmentCenter;
    
    companyLabel.textColor = [UIColor blackColor];
    
    NSLayoutConstraint *cLTrailing = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *cLLeading = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 0];
    
    NSLayoutConstraint *cLTop = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: -5];
    
    
    [backgroundImage addSubview:companyLabel];
    
    cLTrailing.active = YES;
    cLLeading.active = YES;
    cLTop.active = YES;
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    UIFont *smallFont = [UIFont fontWithName:@"Baskerville" size:18.0];
    nameLabel.font = smallFont;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    nameLabel.textColor = [UIColor blackColor];
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -75];
    
    NSLayoutConstraint *nLLeading = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 60];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 30];
    
    [backgroundImage addSubview:nameLabel];
    
    nLTrailing.active = YES;
    nLLeading.active = YES;
    nLTop.active = YES;
    
    
    UILabel *titleLabel = [[UILabel alloc ]init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    titleLabel.text = title;
    titleLabel.font = smallFont;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = [UIColor blackColor];
    
    NSLayoutConstraint *tLTrailing = [NSLayoutConstraint constraintWithItem: titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -75];
    
    NSLayoutConstraint *tLLeading = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 80];
    
    NSLayoutConstraint *tLTop = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 65];
    
    [backgroundImage addSubview:titleLabel];
    
    tLTrailing.active = YES;
    tLLeading.active = YES;
    tLTop.active = YES;
    
    UILabel *phoneLabel = [[UILabel alloc ]init];
    phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    phoneLabel.text = phone;
    phoneLabel.font = smallFont;
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    
    phoneLabel.textColor = [UIColor blackColor];
    
    NSLayoutConstraint *pLTrailing = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant: -75];
    
    NSLayoutConstraint *pLLeading = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: imageView attribute:NSLayoutAttributeLeading multiplier:1.0 constant: 80];
    
    NSLayoutConstraint *pLTop = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: 105];
    
    [backgroundImage addSubview:phoneLabel];
    
    pLTrailing.active = YES;
    pLLeading.active = YES;
    pLTop.active = YES;

    
}
@end
