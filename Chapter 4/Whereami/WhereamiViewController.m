//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Thomas Kimura on 2013-09-22.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //create location manager object
        locationManager = [[CLLocationManager alloc]init];
        
        [locationManager setDelegate:self];
        
        //as accurate as possible
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        //set location manager to notify us every 50 meters
        [locationManager setDistanceFilter:50];
        
        //tell our manager to start looking for its location imediately
        [locationManager startUpdatingLocation];
        
        // Start heading updates.
        if ([CLLocationManager headingAvailable]) {
            // Warning: test this code path on a device, not in iPhone Simulator
            // "heading information is available only for devices that contain a hardware compass" (docs)
            [locationManager setHeadingFilter:5];
            [locationManager startUpdatingHeading];
        }
        else {
            NSLog(@"warning: heading information not available for this device/simulator");
        }
        
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    //prints new heading 
    NSLog(@"The new heading is: %@", newHeading);
}

- (void)dealloc
{
    //location manager stop sending messages
    [locationManager setDelegate:nil];
}




@end
