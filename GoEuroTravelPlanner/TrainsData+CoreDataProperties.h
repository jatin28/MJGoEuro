//
//  TrainsData+CoreDataProperties.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 26/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TrainsData.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainsData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *arrival_time;
@property (nullable, nonatomic, retain) NSString *departure_time;
@property (nullable, nonatomic, retain) NSNumber *number_of_stops;
@property (nullable, nonatomic, retain) NSString *price_in_euros;
@property (nullable, nonatomic, retain) NSString *provider_logo;
@property (nullable, nonatomic, retain) NSNumber *train_id;

@end

NS_ASSUME_NONNULL_END
