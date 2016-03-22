//
//  ViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ViewController.h"

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
