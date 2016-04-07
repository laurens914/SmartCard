//
//  ShareViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
- (IBAction)dismissButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
- (IBAction)shareButton:(id)sender;

@end

@implementation ShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupButton];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setUpImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setUpImageView{
    _imageView.image = _selectedImage;
}

- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupButton
{
    self.cancelButton.layer.cornerRadius = 20;
    self.cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)shareButton:(id)sender {
    
    UIAlertController *alertController = [ UIAlertController alertControllerWithTitle:@"Share Contact Card" message:@"Choose Format" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sendImage = [UIAlertAction actionWithTitle:@"Send As Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImage *shared = _selectedImage;
        NSArray *sharedItems = @[shared];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:sharedItems applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }];
    UIAlertAction *sendLink = [UIAlertAction actionWithTitle:@"Send As Link" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *text = @"Add contact to Address Book";
        NSString *name = _contactData.firstName ? _contactData.firstName :@"";
        NSLog(@"%@", name);
        NSLog(@"%@", _contactData.firstName);
        NSString *lastName = _contactData.lastName ? _contactData.lastName :@"";
        NSString *phone = _contactData.phoneNumber ? _contactData.phoneNumber:@"";
        NSString *emailAddress = _contactData.emailAddress ? _contactData.emailAddress :@"";
        NSString *addressStreet = _contactData.addressStreet ? _contactData.addressStreet :@"";
        NSString *addressCity = _contactData.addressCity ? _contactData.addressCity :@"";
        NSString *addressState = _contactData.addressState ? _contactData.addressState :@"";
        NSString *zipCode = _contactData.addressPostalCode ? _contactData.addressPostalCode : @"";
        NSString *jobTitle = _contactData.positionTitle ? _contactData.positionTitle :@"";
        NSString *organizationName = _contactData.buinessName ? _contactData.buinessName :@"";
        NSString *textMessage = [NSString stringWithFormat:@"SmartCard://= %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", name, lastName,phone,emailAddress, addressState,addressStreet,addressCity,zipCode,jobTitle,organizationName];
        NSArray  *sharedObjects = @[text, textMessage];
         UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:sharedObjects applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }];
    
    [alertController addAction:sendLink];
    [alertController addAction:sendImage];
    [self presentViewController:alertController animated:YES completion:nil];
    
 
}
@end
