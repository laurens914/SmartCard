//
//  ShareViewController.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactData.h"

@interface ShareViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(strong, nonatomic) UIImage* selectedImage;
@property(strong, nonatomic) ContactData * contactData;

@end
