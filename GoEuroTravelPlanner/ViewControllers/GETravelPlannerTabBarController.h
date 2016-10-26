//
//  GETravelPlannerTabBarController.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEConstants.h"
#import "GETravelListingTableViewController.h"

@interface GETravelPlannerTabBarController : UITabBarController
@property (nonatomic,retain) GETravelListingTableViewController *travelListTableObject;
@end
