//
//  CreateViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CreateViewController.h"
#import "TemplateViewController.h"
#import "TemplateAView.h"
#import "TemplateBView.h"
#import "TemplateCView.h"
#import "TemplateDView.h"
#import "TemplateEView.h"
#import "TemplateFView.h"
#import "TemplateGView.h"

@interface CreateViewController ()
- (IBAction)dismissButton:(id)sender;

- (IBAction)enterInfo:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *dismiss;
@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButton];
  
    
    NSLog(@"selected%ld",(long)self.selectedIndex);

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self selectView:self.selectedIndex];
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
-(void)selectView:(NSInteger)index{
    
    switch (index) {
        case 0:
           [TemplateAView setUpViewWithView:self.view];
            break;
        case 1:
            [TemplateBView setUpViewWithView:self.view];
            break;
        case 2:
            [TemplateCView setUpViewWithView:self.view];
            break;
        case 3:
            [TemplateDView setUpViewWithView:self.view];
            break;
        case 4:
            [TemplateEView setUpViewWithView:self.view];
            break;
        case 5:
            [TemplateFView setUpViewWithView:self.view];
            break;
        case 6:
            [TemplateGView setUpViewWithView:self.view];
            break;
            
        default:
            break;
    }
}

//-(UIImage*)takeScreenShot {
//    
//    _imageView.backgroundColor = [self random];
//    
//    UIGraphicsBeginImageContext(self.imageView.frame.size);
//    
//    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//    //really at this point we can give the option to save to photos!
//    
//    [self saveToDesktopFolder:image];
//    
//    return image;
//}


- (IBAction)dismissButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)enterInfo:(UIButton *)sender {
}
@end
