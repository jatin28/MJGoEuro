//
//  TravelData.swift
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

import Foundation

class TravelData:NSObject{
    var arrival_time:NSDate!
    var departure_time:NSDate!
    var number_of_stops:String!
    var price_in_euros:NSDecimalNumber!
    var provider_logo:String!
    
    func initData(arrival_time:NSDate , departure_time:NSDate , number_of_stops:String , price_in_euros:NSDecimalNumber , provider_logo:String) {
        self.arrival_time = arrival_time
        self.departure_time = departure_time
        self.number_of_stops = number_of_stops
        self.price_in_euros = price_in_euros
        self.provider_logo = provider_logo
    }
    
}