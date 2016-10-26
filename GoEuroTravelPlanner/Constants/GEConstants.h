//
//  GEConstants.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#ifndef GEConstants_h
#define GEConstants_h

#define kImageSize 63

//tab bar title constants
#define kBusTabTitle @"Bus"
#define kTrainTabTitle @"Train"
#define kFlightTabTitle @"Flight"

//base URL for All Network API Calls
#define kBaseURL @"https://api.myjson.com/bins/"

//Servic/API Name(s)
#define kBusDataAPIName @"37yzm"
#define kTrainsDataAPIName @"3zmcy"
#define kFlightsDataAPIName @"w60i"

typedef NS_ENUM(NSInteger, SelectedModeType) {
    Bus,
    Train,
    Flight
};

// table cell identifier

#define kCellIdentifier @"travelData"

//keys for Dictionary received from server

#define kArrivalKey @"arrival_time"
#define kDepartureKey @"departure_time"
#define kNoOfStopsKey @"number_of_stops"
#define kPriceInEuroKey @"price_in_euros"
#define kProviderLogoURLKey @"provider_logo"

#endif /* GEConstants_h */
