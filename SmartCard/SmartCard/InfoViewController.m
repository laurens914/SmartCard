//
//  InfoViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
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
