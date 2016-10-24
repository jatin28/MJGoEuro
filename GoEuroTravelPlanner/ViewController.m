//
//  ViewController.m
//  GoEuroTravelPlanner
//
//  Created by Jatin Mohindra on 08/10/16.
//  Copyright © 2016 Jatin Mohindra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSString  *size = [NSString stringWithFormat:@"myurl/%d",kImageSize];
    NSLog(@"%@",size);
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeViewForSelectedMode:(id)sender {
}
@end
