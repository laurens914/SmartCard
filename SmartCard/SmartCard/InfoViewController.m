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
@property (weak, nonatomic) IBOutlet UITextField *textFieldOne;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldThree;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFour;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFive;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSix;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSeven;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEight;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNine;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTen;
@property (weak, nonatomic) IBOutlet UITextField *textFeildEleven;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTwelvee;


@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self templateCTextFields];

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

-(void)templateATextFeilds
{
    [_textFieldOne setPlaceholder:@"Website"];
    [_textFieldTwo setHidden:YES];
    [_textFieldThree setHidden:YES];
    [_textFieldFour setHidden:YES];
    [_textFieldFive setHidden:YES];
    [_textFieldSix setHidden:YES];
    [_textFieldSeven setHidden:YES];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateBTextFeilds
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Email Address"];
    [_textFieldFour setPlaceholder:@"Phone Number"];
    [_textFieldFive setPlaceholder:@"Street"];
    [_textFieldSix setPlaceholder:@"City"];
    [_textFieldSeven setPlaceholder:@"State"];
    [_textFieldEight setPlaceholder:@"Zip"];
    [_textFieldNine setPlaceholder:@"Position"];
    [_textFieldTen setPlaceholder:@"Company"];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateCTextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Email Address"];
    [_textFieldFour setPlaceholder:@"Phone Number"];
    [_textFieldFive setPlaceholder:@"Webiste"];
    [_textFieldSix setPlaceholder:@"Position"];
    [_textFieldSeven setPlaceholder:@"Company"];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateDTextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Phone Number"];
    [_textFieldFour setPlaceholder:@"Company"];
    [_textFieldFive setPlaceholder:@"Position"];
    [_textFieldSix setHidden:YES];
    [_textFieldSeven setHidden:YES];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateETextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Phone Number"];
    [_textFieldFour setHidden:YES];
    [_textFieldFive setHidden:YES];
    [_textFieldSix setHidden:YES];
    [_textFieldSeven setHidden:YES];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateFTextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Phone Number"];
    [_textFieldFour setPlaceholder:@"Email Address"];
    [_textFieldFive setHidden:YES];
    [_textFieldSix setHidden:YES];
    [_textFieldSeven setHidden:YES];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}

-(void)templateGTextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Phone Number"];
    [_textFieldFour setPlaceholder:@"Email Address"];
    [_textFieldFive setPlaceholder:@"Company"];
    [_textFieldSix setPlaceholder:@"Position"];
    [_textFieldSeven setPlaceholder:@"Website"];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [_textFieldTwelvee setHidden:YES];
}






@end
