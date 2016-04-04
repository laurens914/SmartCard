//
//  CreateViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CreateViewController.h"
#import "TemplateViewController.h"
#import "InfoViewController.h"
#import "TemplateAView.h"
#import "TemplateBView.h"
#import "TemplateCView.h"
#import "TemplateDView.h"
#import "TemplateEView.h"
#import "TemplateFView.h"
#import "TemplateGView.h"
#import "CardStore.h"
#import "AppDelegate.h"

@import UIKit;
#import <QuartzCore/QuartzCore.h>

@interface CreateViewController ()

- (IBAction)dismissButton:(id)sender;

- (IBAction)enterInfo:(UIButton *)sender;
//
@property(strong, nonatomic)UIImageView* currentImageView;

@property(strong, nonatomic)UIView* currentView;

@property (weak, nonatomic) IBOutlet UIButton *dismiss;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupButton];
    _isInfo = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (_isInfo == NO) {
        
        [self selectView:self.selectedIndex];
        _isInfo = YES;
    }

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    NSLog(@"%@", _currentView);
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

-(UIView*)selectView:(NSInteger)index{
    
    switch (index) {
        case 0:
            
         [TemplateAView setUpViewWithView:self.view website:@"www.fullName.com"];
            break;
            
        case 1:
            
           [TemplateBView setUpViewWithView:self.view name:@"Full Name" firstAddress:@"123 Street" secondaryAddress:@"City, State, 10292" email:@"yourName@email.com" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company Name" logo:nil];
            
            break;
        case 2:
            
        [TemplateCView setUpViewWithView:self.view name:@"Full Name" firstAddress:@"123 Street" secondaryAddress:@"City, State 10292" email:@"fullName@email.com" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company"];
            break;
        case 3:
           [TemplateDView setUpViewWithView:self.view name:@"Full Name" phone:@"123 666-1234" website:@"www.company.com" jobTitle:@"Job Title" company:@"Company" logo:nil];
            break;
        case 4:
           [TemplateEView setUpViewWithView:self.view name:@"Full Name" phone:@"123 666-1234" logo:nil];
            break;
        case 5:
            [TemplateFView setUpViewWithView:self.view name:@"Full Name" email:@"fullName@email.com" phone:@"123 666-1234" logo:nil];
            break;
        case 6:
         [TemplateGView setUpViewWithView:self.view name:@"Full Name" firstAddress:nil secondaryAddress:nil email:@"yourName@email.com" phone:@"123 666-1234"website:@"www.company.com" jobTitle:@"Job Title" company:@"Company" logo:nil];
            break;
            
        default:
            break;
    }
    
    _isInfo = NO;
    return nil;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"infoViewController"]) {
        
        InfoViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.index = self.selectedIndex;
        
         __weak typeof(self)weak = self;
        
        destinationViewController.completion = ^(NSString *textBoxOne, NSString* textBoxTwo, NSString* textBoxThree, NSString*textBoxFour, NSString* textBoxFive, NSString* textBoxSix, NSString* textBoxSeven, NSString* textBoxEight, NSString* textBoxNine, NSString *textBoxTen, NSString *textBoxEleven, UIImage* logoImage){
            
            
            switch (weak.selectedIndex) {
                    
                case 0:
                    NSLog(@"%@",textBoxOne);
                    
                  
                  _currentImageView = [TemplateAView setUpViewWithView:weak.view website:textBoxOne];
                    
                    break;
                case 1:
                    _currentImageView = [TemplateBView setUpViewWithView:weak.view name:[NSString stringWithFormat:@"%@ %@", textBoxOne, textBoxTwo] firstAddress: textBoxFive secondaryAddress: [NSString stringWithFormat:@"%@ %@ %@", textBoxSix, textBoxSeven, textBoxEight] email:textBoxThree phone:textBoxFour website:nil jobTitle:textBoxNine company:textBoxTen logo:logoImage];
                    break;
                case 2:
                
                _currentImageView =[TemplateCView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", textBoxOne, textBoxTwo] firstAddress:nil secondaryAddress:nil email:textBoxThree phone:textBoxFour website:textBoxFive jobTitle:textBoxSix company:textBoxSeven];
                    break;
                case 3:
                  _currentImageView = [TemplateDView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", textBoxOne, textBoxTwo] phone:textBoxThree website:nil jobTitle:textBoxFive company:textBoxFour logo:logoImage];
                    break;
                case 4:
                 _currentImageView = [TemplateEView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", textBoxOne, textBoxTwo] phone:textBoxThree logo:logoImage];
                    break;
                case 5:
                  _currentImageView = [TemplateFView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", textBoxOne, textBoxTwo] email:textBoxFour phone:textBoxThree logo:logoImage];
                    break;
                case 6:
                   _currentImageView = [TemplateGView setUpViewWithView:self.view name:[NSString stringWithFormat:@"%@ %@", textBoxTwo, textBoxTwo] firstAddress:nil secondaryAddress:nil email:textBoxFour phone: textBoxThree website:textBoxSeven jobTitle:textBoxSix company:textBoxFive logo:logoImage];
                    break;
                    
                default:
                    break;
            }

            
        };
        
    }
}

-(UIImage*)takeScreenShot:(UIImageView*)selectedView{
    
    
    CGSize size = CGSizeMake(selectedView.frame.size.width, selectedView.bounds.size.height);
   
    UIGraphicsBeginImageContextWithOptions(size, selectedView.opaque, 0.0f);
    
    [selectedView.layer renderInContext:UIGraphicsGetCurrentContext()];

    
    UIImage* screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(screenShot)];
    
    UIGraphicsEndImageContext();
    
    //Saving Image Data

    [[CardStore shared]saveCardImage:imageData];

    return screenShot;
}


- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)enterInfo:(UIButton *)sender {
}

- (IBAction)save:(UIButton *)sender {
    
    [self takeScreenShot: _currentImageView];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
