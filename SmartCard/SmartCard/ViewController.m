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

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *createHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *savedHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *savedCollectionView;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) BOOL isSavedShowing;
@property (nonatomic) CGFloat halfScreenHeight;
@property (nonatomic) CGPoint lastKnownTranslation;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHeightConstrains];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setupCollectionView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpHeightConstrains{
    _createHeight.constant = self.view.frame.size.height / 2;
    _savedHeight.constant = self.view.frame.size.height / 2;
    self.isSavedShowing = NO;
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
    if (self.isSavedShowing) {
        [self setUpHeightConstrains];
    } else {
        _createHeight.constant = 0.0;
        _savedHeight.constant = 60.0;
        self.isSavedShowing = YES;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
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
