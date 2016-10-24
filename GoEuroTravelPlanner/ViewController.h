//
//  ViewController.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 08/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants/GEConstants.h"

@interface ViewController : UIViewController<UITabBarDelegate,UITabBarControllerDelegate>

- (IBAction)changeViewForSelectedMode:(id)sender;

@end

