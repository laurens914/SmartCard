//
//  TemplateCView.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateCView.h"

@implementation TemplateCView

+(UIImageView*)setUpViewWithView:(UIView*)view name:(NSString*)name firstAddress:(NSString*)firstAddress secondaryAddress:(NSString*)secondaryAddress email:(NSString*)email phone:(NSString*)phone website:(NSString*)website jobTitle:(NSString*)title company:(NSString*)company{
    
    Boolean isFiveORFour;
    
    
    
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 480.0)) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 568.0)))) {
        
        isFiveORFour = YES;
        
    }else{
        
        isFiveORFour = NO;
        
    }

    
    UIView *viewX = [[UIView alloc]init];
    viewX.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:isFiveORFour?  231.0 : 350.0];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:isFiveORFour? 132.0 : 200.0];
    
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterXWithinMargins multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:viewX attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterYWithinMargins multiplier:1.0 constant:0];
    
    [view addSubview:viewX];
    
    
    width.active = YES;
    height.active = YES;
    centerX.active = YES;
    centerY.active = YES;

    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TempC.png"]];
    backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *BGILeading = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    NSLayoutConstraint *BGITrailing = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    NSLayoutConstraint *BGITop = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:isFiveORFour? -13.2 :-20];
    
    NSLayoutConstraint *BGIBottom = [NSLayoutConstraint constraintWithItem:backgroundImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: viewX attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: isFiveORFour? 13.2 : 20];
    
//    backgroundImage.contentMode = UIViewContentModeScaleToFill;
    [viewX addSubview:backgroundImage];
    
    BGILeading.active = YES;
    BGITrailing.active = YES;
    BGITop.active = YES;
    BGIBottom.active = YES;
    
    
    UILabel *companyLabel = [[UILabel alloc ]init];
    companyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    companyLabel.text = company;
    UIFont *font = [UIFont fontWithName:@"Damascus" size:isFiveORFour ? 9.9 : 15.0];
    companyLabel.font = font;
    companyLabel.textAlignment = NSTextAlignmentCenter;
    
    UIColor *textColor = [UIColor blackColor];
    companyLabel.textColor = textColor;
    
    NSLayoutConstraint *cLLLeading = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: isFiveORFour? 6.6 : +10];
    
    NSLayoutConstraint *cLLTop = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? 70.2 : 120];
    
    NSLayoutConstraint *cLLBotton = [NSLayoutConstraint constraintWithItem:companyLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:isFiveORFour ? -33 : -50];
    
    [backgroundImage addSubview:companyLabel];
    
    cLLLeading.active = YES;
    cLLTop.active = YES;
    
    cLLBotton.active = YES;
    
    
    
    UILabel *positionLabel = [[UILabel alloc ]init];
    positionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    positionLabel.text = title;
    UIFont *smallFont = [UIFont fontWithName:@"Damascus" size:isFiveORFour ? 8.58 : 13.0];
    positionLabel.font = smallFont;
    positionLabel.textAlignment = NSTextAlignmentCenter;
    
    positionLabel.textColor = textColor;
    
    
    NSLayoutConstraint *pLLeading = [NSLayoutConstraint constraintWithItem:positionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant:isFiveORFour ? 6.6 : +10];
    
    NSLayoutConstraint *pLTop = [NSLayoutConstraint constraintWithItem:positionLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:isFiveORFour ? 85 : 150];
    
    NSLayoutConstraint *pLBotton = [NSLayoutConstraint constraintWithItem:positionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:isFiveORFour ? -20.4 : -40];
    
    
    [backgroundImage addSubview:positionLabel];
    
    pLLeading.active = YES;
    pLBotton.active = YES;
    pLTop.active= YES;
    
    
    UILabel *websiteLabel = [[UILabel alloc ]init];
    websiteLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    websiteLabel.text = website;
    websiteLabel.font = smallFont;
    websiteLabel.textAlignment = NSTextAlignmentCenter;
    
    websiteLabel.textColor = textColor;
    
    NSLayoutConstraint *wLLeading = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant: isFiveORFour ? 6.6 : +10];
    
    NSLayoutConstraint *wLTop = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:isFiveORFour? 104: 170];
    
    NSLayoutConstraint *wLBotton = [NSLayoutConstraint constraintWithItem:websiteLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:isFiveORFour? -13.2 : -20];
    
    [backgroundImage addSubview:websiteLabel];
    
    wLLeading.active = YES;
    wLBotton.active = YES;
    wLTop.active = YES;
    
    UILabel *nameLabel = [[UILabel alloc ]init];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = name;
    nameLabel.font = font;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.adjustsFontSizeToFitWidth = YES;

    nameLabel.numberOfLines = 2.0;

    nameLabel.textColor = textColor;
    
    NSLayoutConstraint *nLWidth = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:isFiveORFour? 66: 100];
    
    NSLayoutConstraint *nLTrailing = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:isFiveORFour? -6.6 : -10];
    
    NSLayoutConstraint *nLTop = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? -2.6: -6];
    
    NSLayoutConstraint *nLBotton = [NSLayoutConstraint constraintWithItem:nameLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:isFiveORFour ? -105.0 : -160];
    
    [backgroundImage addSubview:nameLabel];
    
    nLWidth.active = YES;
//    nLHeight.active = YES;
    
    nLTrailing.active = YES;
    nLTop.active = YES;
    nLBotton.active = YES;
    
    
    
    UILabel *phoneLabel = [[UILabel alloc ]init];
    phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    phoneLabel.text = phone;
    phoneLabel.font = smallFont;
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    
    phoneLabel.textColor = textColor;
    
    
    NSLayoutConstraint *ppLTrailing = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:isFiveORFour ? -6.6 : -10];
    
    NSLayoutConstraint *ppLTop = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:isFiveORFour? 20 : 40];
    
    NSLayoutConstraint *ppLBotton = [NSLayoutConstraint constraintWithItem:phoneLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: isFiveORFour ? -92.4  : -140];
    
    [backgroundImage addSubview:phoneLabel];
    
    ppLTop.active = YES;
    ppLBotton.active = YES;
    ppLTrailing.active = YES;
    
    
    UILabel *emailLabel = [[UILabel alloc ]init];
    emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    emailLabel.text = email;
    
    UIFont *smallestFont = [UIFont fontWithName:@"Damascus" size:isFiveORFour? 6.6 : 10.0];
    emailLabel.font = smallestFont;
    emailLabel.textAlignment = NSTextAlignmentCenter;
    
    emailLabel.textColor = textColor;
    
    NSLayoutConstraint *eLTrailing = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeLeading multiplier:1.0 constant:isFiveORFour ? 6.6 : 10];
    
    NSLayoutConstraint *eLTop = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant: isFiveORFour? 110 : 190];
    
    NSLayoutConstraint *eLBotton = [NSLayoutConstraint constraintWithItem:emailLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: backgroundImage attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant: 0];
    
    [backgroundImage addSubview:emailLabel];
    
    eLTrailing.active = YES;
    eLTop.active = YES;
    eLBotton.active = YES;
    

    return backgroundImage;
}
@end
