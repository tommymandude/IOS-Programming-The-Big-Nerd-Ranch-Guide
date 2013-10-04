//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Thomas Kimura on 2013-09-22.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSString *string = [dateFormatter stringFromDate:date];
    
    //instance of bnrpoint
    BNRMapPoint *mp = [[BNRMapPoint alloc]initWithCoordinate:coord
                                                       title:[locationTitleField text]
                                                        subtitle:string];
    
    //add instace to mapview
    [worldView addAnnotation:mp];
    
    //zoom to region
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    
    //reset ui
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}


-(void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
    [toggle addTarget:self
                         action:@selector(toggleMapType:)
               forControlEvents:UIControlEventValueChanged];
}

-(void) toggleMapType:(id)sender
{
    if ([toggle selectedSegmentIndex] == 0) {
        [worldView setMapType:MKMapTypeStandard];
    }
    if ([toggle selectedSegmentIndex] == 1) {
        [worldView setMapType:MKMapTypeSatellite];
    }
    if ([toggle selectedSegmentIndex] == 2) {
        [worldView setMapType:MKMapTypeHybrid];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

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
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    //how long ago
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    
    //cllocation mangers will return last found location
    //ignore this if more than 3 minutes ago
    if (t < -180) {
        //keep looking
        return;
    }
    [self foundLocation:newLocation];
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
