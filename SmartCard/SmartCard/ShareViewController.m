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
        //
    }];
    
    [alertController addAction:sendLink];
    [alertController addAction:sendImage];
    [self presentViewController:alertController animated:YES completion:nil];
    
 
}
@end
