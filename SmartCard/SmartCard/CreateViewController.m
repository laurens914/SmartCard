//
//  CreateViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()
- (IBAction)dismissButton:(id)sender;

- (IBAction)enterInfo:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *dismiss;
@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)setupButton
{
    self.dismiss.layer.cornerRadius = 20;
    self.dismiss.layer.borderColor = [UIColor whiteColor].CGColor;
    
}


- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)enterInfo:(UIButton *)sender {
}
@end
