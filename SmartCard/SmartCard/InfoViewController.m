//
//  InfoViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *uploadImage;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)dismiss:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *website;
@property (weak, nonatomic) IBOutlet UITextField *addressStreet;
@property (weak, nonatomic) IBOutlet UITextField *addressStreetTwo;
@property (weak, nonatomic) IBOutlet UITextField *adressCity;
@property (weak, nonatomic) IBOutlet UITextField *addressState;
@property (weak, nonatomic) IBOutlet UITextField *addressZip;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UITextField *position;

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)dismiss:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInfo:(UIButton *)sender {
    
    self.completion(_firstNameLabel.text, _lastNameLabel.text, _emailLabel.text, _phoneLabel.text, _webSiteLabel.text, _streetAddressLabel.text, _cityLabel.text, _imageView.image, _companyLabel.text, _postitionLable.text);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)add:(UIButton *)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate =self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *newImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = newImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
