//
//  ViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ViewController.h"
#import "HomeCollectionViewFlowLayout.h"
#import "SavedCollectionViewFlowLayout.h"
#import "SavedCollectionViewCell.h"
@import UIKit;

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
- (IBAction)create:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *createHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *savedHeight;

@property (weak, nonatomic) IBOutlet UICollectionView *savedCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self setUpHeightConstrains];
    [self setupCollectionView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpHeightConstrains{
    _createHeight.constant = self.view.frame.size.height / 2;
    _savedHeight.constant = self.view.frame.size.height / 2;
}

-(void)setupCollectionView
{
    SavedCollectionViewFlowLayout *savedCollectionViewFlow = [[SavedCollectionViewFlowLayout alloc]init];
    
    self.savedCollectionView.delegate = self;
    self.savedCollectionView.dataSource = self;
    
    self.savedCollectionView.collectionViewLayout = savedCollectionViewFlow;
    
    UIColor *colorTwo = [UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:0.5];
    
    [_savedCollectionView setBackgroundColor:colorTwo];
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


-(void)setupCollectionViewFlowLayout
{
    HomeCollectionViewFlowLayout *homeViewCollectionLayout = [[HomeCollectionViewFlowLayout alloc]init];
    _savedCollectionView.collectionViewLayout = homeViewCollectionLayout;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SavedCollectionViewCell *savedCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"savedCell" forIndexPath:indexPath];
    
//    UIImage *savedImage = self.dataSource[indexPath.row];
    
//    savedCell.imageView.image = savedImage;
    savedCell.backgroundColor = [UIColor blackColor];
    
    return savedCell;
    
}

@end
