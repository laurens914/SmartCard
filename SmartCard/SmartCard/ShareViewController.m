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

@end

@implementation ShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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

@end
