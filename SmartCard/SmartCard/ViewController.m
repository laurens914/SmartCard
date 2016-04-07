//
//  ViewController.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ViewController.h"
#import "ShareViewController.h"
#import "TemplateViewController.h"
#import "HomeCollectionViewFlowLayout.h"
#import "SavedCollectionViewFlowLayout.h"
#import "SavedCollectionViewCell.h"
#import "ContactData.h"
#import "ContactService.h"
#import "CardStore.h"

@import UIKit;

CGFloat const kSavedMenuFinishLineMultipler = 0.28;
NSTimeInterval const kAnimationDurationOPEN = 0.3;
NSTimeInterval const kAnimationDurationCLOSE = 0.3;

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate>
- (IBAction)create:(UIButton *)sender;
- (IBAction)save:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *createHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *savedHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *savedCollectionView;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic) BOOL isSavedShowing;
@property (nonatomic) CGFloat halfScreenHeight;
@property (nonatomic) CGPoint lastKnownTranslation;
@property (nonatomic) BOOL editEnabled;

@property (strong, nonatomic)NSMutableArray* dataSource;

@property (weak, nonatomic)ViewController *selfSender;
@property (strong, nonatomic)ContactData* selectedCard;


- (IBAction)deleteCellButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.halfScreenHeight = (self.view.frame.size.height/2)-0.1;
    [self hideSavedTemplatesAnimated:NO];
    [self setupPanGesture];
    [self setupLongPress];
    [self setupButton];
    [self setDataSourceWithSavedImages];
    _cancelButton.hidden = YES;
    
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

-(void)setupCollectionView
{
    SavedCollectionViewFlowLayout *savedCollectionViewFlow = [[SavedCollectionViewFlowLayout alloc]init];
    self.savedCollectionView.delegate = self;
    self.savedCollectionView.dataSource = self;
    self.savedCollectionView.collectionViewLayout = savedCollectionViewFlow;
    UIColor *colorTwo = [UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:0.5];
    [self.savedCollectionView setBackgroundColor:colorTwo];
}

#pragma mark - Animations for saved button

-(void)animateConstraints{
    if (self.isSavedShowing) {
        [self hideSavedTemplatesAnimated:YES];
        self.editEnabled = NO;
        _cancelButton.hidden = YES;
    } else {
        [self showSavedTemplatesAnimated:YES];
    }
}

-(void)hideSavedTemplatesAnimated:(BOOL)animated {
    self.createHeight.constant = self.halfScreenHeight;
    self.savedHeight.constant = self.halfScreenHeight;
    self.isSavedShowing = NO;
    if (animated) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:kAnimationDurationCLOSE animations:^{
            [weakSelf.view layoutIfNeeded];
        }]; return;
    }
    [self.view layoutIfNeeded];
}

-(void)showSavedTemplatesAnimated:(BOOL)animated {
    self.createHeight.constant = 0.0;
    self.savedHeight.constant = 60.0;
    self.isSavedShowing = YES;
    if (animated) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:kAnimationDurationOPEN animations:^{
            [weakSelf.view layoutIfNeeded];
        }]; return;
    }
    [self.view layoutIfNeeded];
}

#pragma mark - Get Saved Images & Prepare For Segue

-(void)setDataSourceWithSavedImages{
    _dataSource = [NSMutableArray arrayWithArray:[[CardStore shared]returnCardImages]];
    for (ContactData *contact in _dataSource) {
        NSLog(@"%@", contact.firstName);

    }
    [_savedCollectionView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"sharedViewController"]) {
        
        NSIndexPath *path = [[_savedCollectionView indexPathsForSelectedItems]objectAtIndex:0];
            
        _selectedCard = _dataSource[path.row];
        NSLog(@"%@", _selectedCard.firstName);
        
        UIImage *selectedImage = [UIImage imageWithData:_selectedCard.businessCardData];
        
        ShareViewController *shareVC = segue.destinationViewController;
        shareVC.selectedImage = selectedImage;
        shareVC.contactData = _selectedCard;

    }
    
    if ([segue.identifier isEqualToString:@"templateViewController"]) {
        
        _selfSender = self;
        
        TemplateViewController *templateVC = segue.destinationViewController;

        
        templateVC.selfSender = _selfSender;
        NSLog(@"senderTVC: %@", _selfSender);
    }
}

#pragma mark - Pan Gesture

- (void)setupPanGesture {
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(tvcPanned:)];
    [self.saveButton addGestureRecognizer:pan];
    self.panGesture=pan;
}

- (void)tvcPanned:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged) {
        [self panGestureStateChangedWithSender:sender];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [self panGestureStateEndedWithSender:sender];
    }
}

- (void)panGestureStateChangedWithSender:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.view];
    CGPoint translation = [sender translationInView:self.view];
    
    if (self.savedHeight.constant >= 60 && self.savedHeight.constant <= self.halfScreenHeight) {
        
        if (self.savedHeight.constant >= self.halfScreenHeight && velocity.y>0) {
            self.createHeight.constant += translation.y;
            self.savedHeight.constant -= translation.y;
        } else {
            self.createHeight.constant += translation.y;
            self.savedHeight.constant += translation.y*0.82;
        }
        
        [self setLastKnownTranslation:translation];
    }
    
    [sender setTranslation:CGPointZero inView:self.view];
}

- (void)panGestureStateEndedWithSender:(UIPanGestureRecognizer *)sender {
    CGFloat finishLine = self.view.frame.size.height * kSavedMenuFinishLineMultipler;
    CGFloat currentHeight = self.savedHeight.constant;
    
    if (self.lastKnownTranslation.y > 0) {
        [self hideSavedTemplatesAnimated:YES];
    } else if (self.lastKnownTranslation.y < 0) {
        [self showSavedTemplatesAnimated:YES];
    } else if (currentHeight > finishLine) {
        [self hideSavedTemplatesAnimated:YES];
    } else {
        [self showSavedTemplatesAnimated:YES];
    }
}

#pragma mark - Buttons
-(void)setupButton
{
    self.cancel.layer.cornerRadius = 15;
}

- (IBAction)create:(UIButton *)sender {
}

- (IBAction)save:(UIButton *)sender {
    [self animateConstraints];
    [self setDataSourceWithSavedImages];
}

#pragma mark - CollectionView Stuff

-(void)setupCollectionViewFlowLayout
{
    HomeCollectionViewFlowLayout *homeViewCollectionLayout = [[HomeCollectionViewFlowLayout alloc]init];
    [self savedCollectionView].collectionViewLayout = homeViewCollectionLayout;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SavedCollectionViewCell *savedCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"savedCell" forIndexPath:indexPath];
    
    savedCell.backgroundColor = [UIColor blackColor];
    ContactData *card = _dataSource[indexPath.row];
    savedCell.selectedCellIndexPath = indexPath;
    UIImage *cardImage = [UIImage imageWithData:card.businessCardData];

    savedCell.imageView.image = cardImage;
    if (self.editEnabled == NO){
        savedCell.deleteButton.alpha = 0.0;
        savedCell.deleteButton.enabled = NO;
    }
    if(self.editEnabled == YES){
    savedCell.deleteButton.alpha = 1.0;
    savedCell.deleteButton.enabled = YES;
    }
    return savedCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.editEnabled){
    [self performSegueWithIdentifier:@"sharedViewController" sender:nil];
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ContactData *card = _dataSource[indexPath.row];
    UIImage *cardImage = [UIImage imageWithData:card.businessCardData];

    
    CGSize size = cardImage.size;
    
    if (size.width > size.height) {
        //        Landscape Card
        return CGSizeMake(175.0, 100.0);
    } else {
        //        Portrait Card
        return CGSizeMake(99.0, 200.0);
    }
}


- (IBAction)deleteCellButton:(id)sender {
    
    SavedCollectionViewCell* cell = (SavedCollectionViewCell*)[[sender superview]superview];
    NSIndexPath *indexPath = [self.savedCollectionView indexPathForCell:cell];
    
    NSLog(@"path.row%@",self.dataSource[indexPath.row]);
    
    ContactData *imageToDelete = self.dataSource[indexPath.row];
    
    [self.dataSource removeObjectAtIndex:indexPath.row];
    [[CardStore shared]removeCard:imageToDelete];
    
    
    [self.savedCollectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    if ([self.dataSource count ] == 0) {
        
        self.editEnabled = NO;
        _cancelButton.hidden = YES;
        [self.savedCollectionView reloadData];
    }
    
}



-(void)setupLongPress
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    longPress.delegate = self;
    [self.savedCollectionView addGestureRecognizer:longPress];
    longPress.minimumPressDuration = 0.5;
    longPress.delaysTouchesBegan = YES;
    
}


-(void)longPressGesture:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.editEnabled = YES;
        _cancelButton.hidden = NO;
        [self.savedCollectionView reloadData];
        }
}

- (IBAction)cancel:(UIButton *)sender {
    
    self.editEnabled = NO;
    _cancelButton.hidden = YES;
    [self.savedCollectionView reloadData];
}



















@end
