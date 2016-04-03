//
//  ShareViewController.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardImage.h"

@interface ShareViewController : UIViewController
@property(strong, nonatomic)CardImage* selectedCard;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
