//
//  CreateViewController.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateViewController.h"
#import "ContactData.h"

@interface CreateViewController : UIViewController

@property(weak, nonatomic)ViewController* selfSender;
@property(strong, nonatomic)ContactData *thisContact;

@property NSInteger selectedIndex;

@property BOOL isInfo;

@end
