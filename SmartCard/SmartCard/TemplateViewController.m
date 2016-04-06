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
#import "CreateViewController.h"

#define Y_POS targetContentOffset->y

@interface TemplateViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (IBAction)cancelButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *dismiss;

@property (weak, nonatomic) IBOutlet UICollectionView *templateCollectionView;

@property (strong,nonatomic) NSArray *dataSource;

@property NSUInteger selectedIndex;


@end

@implementation TemplateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.71 green:0.76 blue:0.85 alpha:1.0]];
    [self setupButton];
    [self setupCollectionView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    sender = _templateCollectionView;
    
    if ([segue.identifier isEqualToString:@"createVC"]) {
        
        CreateViewController *destinationVC = segue.destinationViewController;
        
        NSIndexPath *path = [[_templateCollectionView indexPathsForSelectedItems]objectAtIndex:0];
        
        _selectedIndex = path.row;
        
        destinationVC.selectedIndex = self.selectedIndex;
        
    }
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
    self.dismiss.tintColor = [UIColor blackColor];
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
    
    [self carouselAlgorithm:templateCell];
    
    return templateCell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

 
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage * currImage = [self.dataSource objectAtIndex:indexPath.row];
    
    CGSize size = currImage.size;
    
    if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 480.0)) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 568.0)))) {
        
        if (size.width > size.height) {
            return CGSizeMake(300.0, 170.0);
        } else {
            return CGSizeMake(250.0, 390.0);
        }
        
    } else {
        
        if (size.width > size.height) {
            return CGSizeMake(350.0, 200.0);
        } else {
            return CGSizeMake(300.0, 600.0);
        }
    }
}

/*
 
 viewXWidth = 231.0;
 viewXHeight = 132.0;
 websiteTop = 60.0;
 fontSize = 16.0;
 
 }else{
 viewXWidth = 350.0;
 viewXHeight = 200.0;
 websiteTop = 90.0;
 fontSize = 20.0;
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.templateCollectionView]) {
        
        NSArray * currentVisisbleCells = [self.templateCollectionView visibleCells];
        
        for (TemplateCollectionViewCell *visibleCell in currentVisisbleCells) {
            [self carouselAlgorithm:visibleCell];
        }
        
    }
}

-(void)carouselAlgorithm:(UICollectionViewCell *)cell {
    CGPoint viewCenter = self.view.center;
    CGFloat viewHeight = self.view.frame.size.height;
    CGPoint cellCenter = [self.templateCollectionView convertPoint:cell.center toView:self.view];
    
    CGFloat startingSize = 0.5;
    CGFloat scale = cellCenter.y >= viewCenter.y ? ((viewHeight-cellCenter.y)/viewHeight)+startingSize
    : (cellCenter.y/viewHeight)+startingSize;
    
    cell.transform = CGAffineTransformMakeScale(scale, scale);

}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if ([scrollView isEqual:self.templateCollectionView]) {
    
//       Y_POS is used in a #define statement at the top of the page. The compiler replaces all instances of
//       Y_POS with 'targetContentOffset->y' before building the project.
        
//        NSLog(@"------Finished scrolling! Y = %f", Y_POS);
        
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















