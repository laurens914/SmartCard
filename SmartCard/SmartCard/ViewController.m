//
//  ViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ViewController.h"
@import UIKit;

@interface ViewController ()
- (IBAction)create:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *createHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *savedHeight;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self setUpHeightConstrains];
}

-(void)setUpColors{
    UIColor *colorOne = [UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:0.5];
    
    UIColor *colorThree = [UIColor colorWithRed:0.51 green:0.52 blue:0.54 alpha:1.0];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpHeightConstrains{
    _createHeight.constant = self.view.frame.size.height / 2;
    _savedHeight.constant = self.view.frame.size.height / 2;
}
-(void)animateConstraints{
    [UIView animateWithDuration:1.0 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        _createHeight.constant = 60.0;
        _savedHeight.constant = 60.0;
        
    } completion:^(BOOL finished) {
        //
    }];
}

- (IBAction)create:(UIButton *)sender {
}

- (IBAction)save:(UIButton *)sender {
    [self animateConstraints];
}
@end
