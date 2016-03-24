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

#define Y_POS targetContentOffset->y

@interface TemplateViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
- (IBAction)cancelButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *dismiss;
@property (weak, nonatomic) IBOutlet UICollectionView *templateCollectionView;
@property (strong,nonatomic) NSArray *dataSource;

@end

@implementation TemplateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:1.0]];
    [self setupButton];
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TemplateCollectionViewCell *templateCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"templateCell" forIndexPath:indexPath];
    
    UIImage *templateImage = self.dataSource[indexPath.row];
    
    templateCell.imageView.image = templateImage;

    
    
    return templateCell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIImage * currImage = [self.dataSource objectAtIndex:indexPath.row];
    
    CGSize size = currImage.size;
    
    if (size.width > size.height) {
        //Landscape Card
        
        return CGSizeMake(350.0, 200.0);
    } else {
        //Portrait Card
        
        return CGSizeMake(300.0, 600.0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.templateCollectionView]) {

        CGFloat y = scrollView.contentOffset.y;
        NSLog(@"View is scrolling... %f", y);
        NSLog(@" ");
        
        
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if ([scrollView isEqual:self.templateCollectionView]) {
    
        
        NSLog(@"------Finished scrolling! Y = %f", Y_POS);
        
        if (Y_POS < 115) {
            Y_POS = 0;
        } else if (Y_POS < 335) {
            Y_POS = 225;
        } else if (Y_POS < 555) {
            Y_POS = 445;
        } else if (Y_POS < 775) {
            Y_POS = 665;
        } else if (Y_POS < 995) {
            Y_POS = 885;
        } else if (Y_POS < 1595) {
            Y_POS = 1295;
        } else if (Y_POS < 2195) {
            Y_POS = 1895;
        }
        
    }
}

@end















