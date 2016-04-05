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
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (nonatomic)CGPoint selfCenter;

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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [self setKeyBoardDelegate];
    
}

-(void)keyBoardWillShow:(NSNotification*)sender{
    
    NSDictionary *userInfo = sender.userInfo;
    
    NSValue *keyboard = userInfo[UIKeyboardFrameBeginUserInfoKey];
    
    CGPoint center = self.view.center;
    
     self.selfCenter = center;
    
    center.y = [keyboard CGRectValue].size.height;

    
    NSNumber *keyboardDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    
    [UIView animateWithDuration:keyboardDuration.doubleValue animations:^{
        
            self.view.center = center;
    }];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}
-(void)loadView
{
    [super loadView];
    [self setupSelectedTextFields:_index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)setKeyBoardDelegate{
    
    _textFieldOne.delegate = self;
    _textFieldTwo.delegate = self;
    _textFieldThree.delegate = self;
    _textFieldFour.delegate = self;
    _textFieldFive.delegate = self;
    _textFieldSix.delegate = self;
    _textFieldSeven.delegate = self;
    _textFieldEight.delegate = self;
    _textFieldNine.delegate = self;
    _textFieldTen.delegate = self;
    _textFeildEleven.delegate = self;
}

-(void)dismiss{
    
    self.view.center = self.selfCenter;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self dismiss];
    return YES;
}

- (IBAction)dismiss:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInfo:(UIButton *)sender {
    
    self.completion(_textFieldOne.text, _textFieldTwo.text, _textFieldThree.text,_textFieldFour.text, _textFieldFive.text, _textFieldSix.text, _textFieldSeven.text, _textFieldEight.text, _textFieldNine.text, _textFieldTen.text, _textFeildEleven.text, _imageView.image);
    
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
    [self.imageButton setHidden:YES];
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
}

-(void)templateCTextFields
{
    [_textFieldOne setPlaceholder:@"First Name"];
    [_textFieldTwo setPlaceholder:@"Last Name"];
    [_textFieldThree setPlaceholder:@"Email Address"];
    [_textFieldFour setPlaceholder:@"Phone Number"];
    [_textFieldFive setPlaceholder:@"Website"];
    [_textFieldSix setPlaceholder:@"Position"];
    [_textFieldSeven setPlaceholder:@"Company"];
    [_textFieldEight setHidden:YES];
    [_textFieldNine setHidden:YES];
    [_textFieldTen setHidden:YES];
    [_textFeildEleven setHidden:YES];
    [self.imageButton setHidden:YES];
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
}


-(void)setupSelectedTextFields:(NSInteger)index
{
    switch (index) {
            
        case 0:
            [self templateATextFeilds];
            break;
        case 1:
            [self templateBTextFeilds];
            break;
        case 2:
            [self templateCTextFields];
            break;
        case 3:
            [self templateDTextFields];
        case 4:
            [self templateETextFields];
            break;
        case 5:
            [self templateFTextFields];
            break;
        case 6:
            [self templateGTextFields];
            break;
        default:
            break;
    }
}




@end
