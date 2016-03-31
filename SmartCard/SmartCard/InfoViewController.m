//
//  InfoViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *uploadImage;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)dismiss:(UIButton *)sender;

@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)dismiss:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInfo:(UIButton *)sender {
    
    self.completion(_firstNameLabel.text, _lastNameLabel.text, _emailLabel.text, _phoneLabel.text, _webSiteLabel.text, _streetAddressLabel.text, _cityLabel.text, _imageView.image, _companyLabel.text, _postitionLable.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
