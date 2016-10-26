//
//  GETravelListingTableViewController.m
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import "GETravelListingTableViewController.h"
#import "WebServicesHandler.h"
#import "AFNetworking.h"
#import "ListDetailTableViewCell.h"
#import "GoEuroTravelPlanner-Swift.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SVProgressHUD.h"



@interface GETravelListingTableViewController ()
@property (nonatomic,retain) TravelData *tavelModelObject;
@property (nonatomic,retain) Commons *commonObj;


@end

@implementation GETravelListingTableViewController
@synthesize dataSourceArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tavelModelObject = [[TravelData alloc] init];
    self.commonObj = [Commons sharedInstance];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    dataSourceArray = [NSArray new];
    [self.tableView setSeparatorColor:[UIColor blueColor]];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [self prepareDataSetForSelectedMode:mode];

[[AFNetworkReachabilityManager sharedManager] startMonitoring];

}

-(void)setModeValue:(SelectedModeType)modeObj
{
   mode = modeObj;
}

-(void)viewDidAppear:(BOOL)animated
{
   // [self prepareDataSetForSelectedMode:self.mode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numOfSections = 0;
    if (dataSourceArray.count>0) {
    
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        numOfSections                = 1;
        self.tableView.backgroundView = nil;
    }
    else
    {
        UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        noDataLabel.text             = @"No data available";
        noDataLabel.textColor        = [UIColor blackColor];
        noDataLabel.textAlignment    = NSTextAlignmentCenter;
        self.tableView.backgroundView = noDataLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return numOfSections;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (dataSourceArray.count>0) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return [self.dataSourceArray count];

    }
    else
    {
       
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListDetailTableViewCell *cell = (ListDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSString *urlString = [[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kProviderLogoURLKey];
    NSString *noOfStopsString = [NSString new];
    if ([[[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kNoOfStopsKey] stringValue] isEqualToString:@"0"]) {
        noOfStopsString = @"Direct";
    }
    else
    {
        noOfStopsString = [NSString stringWithFormat:@"%@ stop",[[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kNoOfStopsKey] stringValue]] ;
    }
    cell.labelArrivalAndDepartureTime.text = [NSString stringWithFormat:@"%@ - %@",[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kArrivalKey],[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kDepartureKey]];
    cell.labelNoOfStops.text = noOfStopsString;
    cell.labelPriceInEuro.text = [NSString stringWithFormat:@"%@ %@",[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kPriceInEuroKey],[self.commonObj getEuroSymbol]];
    cell.imageProviderLogo.clipsToBounds = YES;
    cell.imageProviderLogo.contentMode = UIViewContentModeScaleAspectFit;
    NSString *durationString = [_commonObj getTimeDifferenceBetween:[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kArrivalKey] endTime:[[dataSourceArray objectAtIndex:indexPath.row] valueForKey:kDepartureKey]];
    cell.labelDuration.text = [NSString stringWithFormat:@"%@ H",durationString];
    [cell.imageProviderLogo sd_setImageWithURL:[NSURL URLWithString:[urlString stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"] ]placeholderImage:[UIImage imageNamed:@"Placeholder"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    

}

// method to get data for seleted mode
-(void)prepareDataSetForSelectedMode:(SelectedModeType)mode
{
    WebServicesHandler *webserviceObj = [[WebServicesHandler alloc] init];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        NSLog(@"status changed");
        if (!self.commonObj.isConnectedToNetwork) {
            if (self.commonObj.isiOS7FamilyVersion) {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Network Error" message:@"You are not connected to internet.Pls check your network settings" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"Network Error"
                                              message:@"You are not connected to internet.Pls check your network settings"
                                              preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:ok];
                [self presentViewController:alert animated:YES completion:nil];
            }
            
            
        }
        else
        {
            
            [SVProgressHUD show];
            [webserviceObj getDataForSelectedMode:mode withComletionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
             {
                 if (!error)
                 {
                     
                     dataSourceArray = responseObject;
                     [self parseAndSaveToCoreDataModelForType:mode];
                     dispatch_async(dispatch_get_main_queue(), ^{
                         [self.tableView reloadData];
                     });
                     [SVProgressHUD dismiss];
                     NSLog(@"response %@",dataSourceArray);
                 }
                 else
                 {
                     [self.commonObj stopActivityIndicator];
                     if (mode == Bus) {
                         [BusesData MR_truncateAll];
                         NSArray *busDataArray = [BusesData MR_findAll];
                         dataSourceArray = busDataArray;
                         dispatch_async(dispatch_get_main_queue(), ^{
                             [self.tableView reloadData];
                         });
                         [SVProgressHUD dismiss];

                     }
                     else if (mode == Train)
                     {
                         [TrainsData MR_truncateAll];

                         NSArray *trainDataArray = [TrainsData MR_findAll];
                         dataSourceArray = trainDataArray;
                         dispatch_async(dispatch_get_main_queue(), ^{
                             [self.tableView reloadData];
                         });
                         [SVProgressHUD dismiss];

                     }
                     else
                     {
                         [FlightsData MR_truncateAll];
                         NSArray *flightDataArray = [FlightsData MR_findAll];
                         dataSourceArray = flightDataArray;
                         dispatch_async(dispatch_get_main_queue(), ^{
                             [self.tableView reloadData];
                         });
                         [SVProgressHUD dismiss];

                         
                     }

                     
                     
                 }
                 
             }];
        }

        //check for isReachable here
    }];
}

-(void)parseAndSaveToCoreDataModelForType:(SelectedModeType)mode
{
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    if (mode == Bus) {
        if (dataSourceArray.count) {
            for (int i = 0; i<dataSourceArray.count; i++){
                self.busesDataObject = [BusesData MR_createEntity];
                self.busesDataObject.departure_time = [[dataSourceArray objectAtIndex:i] valueForKey:kDepartureKey];
                self.busesDataObject.arrival_time = [[dataSourceArray objectAtIndex:i] valueForKey:kArrivalKey];
                self.busesDataObject.provider_logo = [[dataSourceArray objectAtIndex:i] valueForKey:kProviderLogoURLKey];
                self.busesDataObject.price_in_euros = [[[dataSourceArray objectAtIndex:i] valueForKey:kPriceInEuroKey] stringValue];
                self.busesDataObject.number_of_stops = [[dataSourceArray objectAtIndex:i] valueForKey:kNoOfStopsKey];
                [context MR_saveToPersistentStoreAndWait];
                
            }
        }
    }
    else if (mode == Train)
    {
        if (dataSourceArray.count) {
            for (int i = 0; i<dataSourceArray.count; i++){
                self.trainsDataObject = [TrainsData MR_createEntity];
                self.trainsDataObject.departure_time = [[dataSourceArray objectAtIndex:i] valueForKey:kDepartureKey];
                self.trainsDataObject.arrival_time = [[dataSourceArray objectAtIndex:i] valueForKey:kArrivalKey];
                self.trainsDataObject.provider_logo = [[dataSourceArray objectAtIndex:i] valueForKey:kProviderLogoURLKey];
                self.trainsDataObject.price_in_euros = [[[dataSourceArray objectAtIndex:i] valueForKey:kPriceInEuroKey] stringValue];
                self.trainsDataObject.number_of_stops = [[dataSourceArray objectAtIndex:i] valueForKey:kNoOfStopsKey];
                [context MR_saveToPersistentStoreAndWait];
                
            }
        }
    }
    else
    {
        if (dataSourceArray.count) {
            for (int i = 0; i<dataSourceArray.count; i++){
                self.flightsDataObject = [FlightsData MR_createEntity];
                self.flightsDataObject.departure_time = [[dataSourceArray objectAtIndex:i] valueForKey:kDepartureKey];
                self.flightsDataObject.arrival_time = [[dataSourceArray objectAtIndex:i] valueForKey:kArrivalKey];
                self.flightsDataObject.provider_logo = [[dataSourceArray objectAtIndex:i] valueForKey:kProviderLogoURLKey];
                self.flightsDataObject.price_in_euros = [[dataSourceArray objectAtIndex:i] valueForKey:kPriceInEuroKey];
                self.flightsDataObject.number_of_stops = [[dataSourceArray objectAtIndex:i] valueForKey:kNoOfStopsKey];
                [context MR_saveToPersistentStoreAndWait];
                
            }
        }
    }
    
}

@end
