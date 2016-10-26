//
//  ListDetailTableViewCell.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 25/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageProviderLogo;
@property (strong, nonatomic) IBOutlet UILabel *labelArrivalAndDepartureTime;
@property (strong, nonatomic) IBOutlet UILabel *labelPriceInEuro;
@property (strong, nonatomic) IBOutlet UILabel *labelNoOfStops;
@property (strong, nonatomic) IBOutlet UILabel *labelDuration;

@end
