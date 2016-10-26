//
//  WebServicesHandler.m
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import "WebServicesHandler.h"
#import "GEConstants.h"
#import "AFNetworking.h"

@implementation WebServicesHandler

#pragma - mark Methods to get URL for APIs
-(NSString *) getURLForFetchingFlightsData
{
    return [NSString stringWithFormat:@"%@%@",kBaseURL,kFlightsDataAPIName];
}

-(NSString *) getURLForFetchingTrainsData
{
    return [NSString stringWithFormat:@"%@%@",kBaseURL,kTrainsDataAPIName];
}
-(NSString *) getURLForFetchingBusesData
{
    return [NSString stringWithFormat:@"%@%@",kBaseURL,kBusDataAPIName];
}

#pragma - mark Methods to fetch Data from APIs

-(void) getDataForSelectedMode:(SelectedModeType)mode withComletionHandler:(CompletionHandler)handler{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL;
    if (mode == Train) {
      URL  = [NSURL URLWithString:[self getURLForFetchingTrainsData]];
    }
    else if (mode == Bus)
    {
        URL  = [NSURL URLWithString:[self getURLForFetchingBusesData]];
 
    }
    else
    {
        URL  = [NSURL URLWithString:[self getURLForFetchingFlightsData]];

    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
    {
        if (error) {
            handler(response,nil,error);
            NSLog(@"Error: %@", error);
        } else {
            handler(response,responseObject,nil);

            NSLog(@"%@", responseObject);
        }
    }];
    [dataTask resume];
}

@end
