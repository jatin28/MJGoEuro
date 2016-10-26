//
//  Commons.swift
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

import Foundation
class Commons:NSObject {
    let activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
    static let sharedInstance = Commons()
   override private init() {}
    
    func isConnectedToNetwork() -> Bool {
        print(AFNetworkReachabilityManager.sharedManager().reachable);
        return AFNetworkReachabilityManager.sharedManager().reachable
    }
    
    func isiOS7FamilyVersion() -> Bool{
        let isiOS7 = floor(NSFoundationVersionNumber) <= floor(NSFoundationVersionNumber_iOS_7_1)

        return isiOS7
    }
    func showActivityIndicatorOnView(parentView:UIView)
    {
        activityIndicator.center = parentView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        parentView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func getEuroSymbol() -> String {
        return "€"
    }
    func getTimeDifferenceBetween(startTime:String , endTime:String) -> NSString
    {
        let df:NSDateFormatter = NSDateFormatter();
        df.dateFormat = "HH:mm"
        let date1:NSDate  = df.dateFromString(startTime)!
        let date2:NSDate  = df.dateFromString(endTime)!
        let interval:NSTimeInterval = date2.timeIntervalSinceDate(date1)
        let hours = abs(interval/3600)             // integer division to get the hours part
        let timeDiff:NSString = NSString(format: "%.02f", hours)
        return timeDiff
    }
}

