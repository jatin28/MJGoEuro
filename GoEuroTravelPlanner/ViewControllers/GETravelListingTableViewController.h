//
//  GETravelListingTableViewController.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrainsData.h"
#import "BusesData.h"
#import "FlightsData.h"

static SelectedModeType mode;

@interface GETravelListingTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIImageView *logoOfProvider;
@property (nonatomic,retain) NSArray *dataSourceArray;
@property (nonatomic,retain) TrainsData *trainsDataObject;
@property (nonatomic,retain) BusesData *busesDataObject;
@property (nonatomic,retain) FlightsData *flightsDataObject;
-(void)prepareDataSetForSelectedMode:(SelectedModeType)mode;
-(void)setModeValue:(SelectedModeType)modeObj;

@end
