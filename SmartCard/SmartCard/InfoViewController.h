//
//  InfoViewController.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateViewController.h"

typedef void(^userInfoCompletion)(NSString *textBoxOne, NSString* textBoxTwo, NSString* textBoxThree, NSString*textBoxFour, NSString* textBoxFive, NSString* textBoxSix, NSString* textBoxSeven, NSString* textBoxEight, NSString* textBoxNine, NSString *textBoxTen, NSString *textBoxEleven, UIImage* logoImage);

@interface InfoViewController : UIViewController



@property NSUInteger index;

@property(strong,nonatomic)userInfoCompletion completion;

@end
