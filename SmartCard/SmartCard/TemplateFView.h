//
//  TemplateFView.h
//  SmartCard
//
//  Created by Vincent Smithers on 3/29/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateFView : UIView

+(UIImageView*)setUpViewWithView:(UIView*)view name:(NSString*)name email:(NSString*)email phone:(NSString*)phone logo:(UIImage*)logo;

@end
