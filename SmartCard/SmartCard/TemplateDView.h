//
//  TemplateDView.h
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateDView : UIView

+(void)setUpViewWithView:(UIView*)view name:(NSString*)name phone:(NSString*)phone website:(NSString*)website jobTitle:(NSString*)title company:(NSString*)company logo:(UIImage*)logo;

@end
