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
        NSString *name = _contactData.firstName ? [_contactData.firstName stringByReplacingOccurrencesOfString:@" " withString:@"_"] :@"";
        NSString *lastName = _contactData.lastName ? [_contactData.lastName stringByReplacingOccurrencesOfString:@" " withString:@"_"] :@"";
        NSString *phone = _contactData.phoneNumber ? [_contactData.phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *emailAddress = _contactData.emailAddress ? [_contactData.emailAddress stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *addressStreet = _contactData.addressStreet ? [_contactData.addressStreet stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *addressCity = _contactData.addressCity ? [_contactData.addressCity stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *addressState = _contactData.addressState ? [_contactData.addressState stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *zipCode = _contactData.addressPostalCode ? [_contactData.addressPostalCode stringByReplacingOccurrencesOfString:@" " withString:@"_"] :  @"";
        NSString *jobTitle = _contactData.positionTitle ? [_contactData.positionTitle stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *organizationName = _contactData.buinessName ? [_contactData.buinessName stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *website = _contactData.website ? [_contactData.website stringByReplacingOccurrencesOfString:@" " withString:@"_"] : @"";
        NSString *textMessage = [NSString stringWithFormat:@"SmartCard://=&firstName=%@&lastName=%@&phoneNumber=%@&email=%@&addressState=%@&addressStreet=%@&addressCity=%@&zipCode=%@&jobTitle=%@&company=%@&website=%@", name, lastName,phone,emailAddress, addressState,addressStreet,addressCity,zipCode,jobTitle,organizationName,website];
        NSArray  *sharedObjects = @[text, textMessage];
         UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:sharedObjects applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }];
    
    [alertController addAction:sendLink];
    [alertController addAction:sendImage];
    [self presentViewController:alertController animated:YES completion:nil];
    
 
}
@end
