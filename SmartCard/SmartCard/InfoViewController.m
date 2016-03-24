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



- (IBAction)dismiss:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
