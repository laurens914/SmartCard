//
//  InfoViewController.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"

typedef void(^userInfoCompletion)(NSString *firstName, NSString* lastName, NSString* email, NSString*phone, NSString* website, NSString* firstAddress, NSString* secondaryAddress, UIImage* logoImage, NSString* companyName, NSString* postion);

@interface InfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *lastNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UITextField *emailLabel;

@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextField *webSiteLabel;

@property (weak, nonatomic) IBOutlet UITextField *streetAddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *aptNumLabel;

@property (weak, nonatomic) IBOutlet UITextField *cityLabel;

@property (weak, nonatomic) IBOutlet UITextField *companyLabel;

@property (weak, nonatomic) IBOutlet UITextField *postitionLable;


@property(strong,nonatomic)userInfoCompletion completion;

@end
