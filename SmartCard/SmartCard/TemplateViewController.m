//
//  TemplateViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateViewController.h"
#import "HomeCollectionViewFlowLayout.h"
#import "BaseTemplate.h"
#import "TemplateCollectionViewCell.h"

@interface TemplateViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
- (IBAction)cancelButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *dismiss;
@property (weak, nonatomic) IBOutlet UICollectionView *templateCollectionView;
@property (strong,nonatomic) NSArray *dataSource;

@end

@implementation TemplateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupButton];
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupButton
{
    self.dismiss.layer.cornerRadius = 20;
    self.dismiss.clipsToBounds = YES;
    self.dismiss.layer.borderWidth = 2;
    self.dismiss.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)cancelButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupCollectionView
{
    HomeCollectionViewFlowLayout *templateCollectionViewLayout = [[HomeCollectionViewFlowLayout alloc]init];
    self.templateCollectionView.delegate = self;
    self.templateCollectionView.dataSource = self;
    self.templateCollectionView.collectionViewLayout = templateCollectionViewLayout;
    UIColor *colorTwo = [UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:0.5];
    
    [_templateCollectionView setBackgroundColor:colorTwo];
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    BaseTemplate *templates = [[BaseTemplate alloc]init];
    self.dataSource = [templates templateImages];
    return self.dataSource.count-1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TemplateCollectionViewCell *templateCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"templateCell" forIndexPath:indexPath];
    
    UIImage *templateImage = self.dataSource[indexPath.row];
    
    templateCell.imageView.image = templateImage;

    
    
    return templateCell;
    
}
@end
