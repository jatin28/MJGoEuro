//
//  FlightsData+CoreDataProperties.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 26/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FlightsData.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlightsData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *arrival_time;
@property (nullable, nonatomic, retain) NSString *departure_time;
@property (nullable, nonatomic, retain) NSNumber *flight_id;
@property (nullable, nonatomic, retain) NSNumber *number_of_stops;
@property (nullable, nonatomic, retain) NSString *price_in_euros;
@property (nullable, nonatomic, retain) NSString *provider_logo;

@end

NS_ASSUME_NONNULL_END
