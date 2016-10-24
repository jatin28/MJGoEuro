//
//  GETravelPlannerTabBarController.m
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 24/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import "GETravelPlannerTabBarController.h"

@interface GETravelPlannerTabBarController ()

@end

@implementation GETravelPlannerTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:kBusTabTitle]) {
        // set condition for showing bus data
    }
    else if ([item.title isEqualToString:kTrainTabTitle])
    {
        //set condition for showing train data
    }
    else
    {
        //set condition for showing 
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
