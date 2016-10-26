//
//  WebServicesHandler.h
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GEConstants.h"
typedef void (^CompletionHandler)(NSURLResponse *response, id responseObject, NSError *error);

@interface WebServicesHandler : NSObject


//methods to get URL for Service Calls
-(NSString *) getURLForFetchingFlightsData;
-(NSString *) getURLForFetchingTrainsData;
-(NSString *) getURLForFetchingBusesData;

//
-(void) getDataForSelectedMode:(SelectedModeType)mode withComletionHandler:(CompletionHandler)handler;
@end
